
require 'nokogiri'
require "base64"

require_relative 'shell'

# module DnrmEarl
  class CifXmlParser

    attr_reader :cif_data, :cif_image, :plan_detail, :parcels, :plan_number, :observation_group, :monuments
    #plan_detail: { plan_number: string, surveyors: [], description: string, submission_date: string,compiled: Yes or No
    #         field_note_flag: string, previous_description: string}
    #parcels: [{ lot_plan_number: string, parcel_type: string, area: string, format: string, klass: string, state: string, type: string, description: string, title: string, geom_kwt: string}, {}, {}...]
    #parcel_type can be 'parcel or neighbour_parcel'

    #observation_group: [{name: "4966", azimuth: "270",
    # horiz_distance: "90.523", distance_type: "measured", azimuth_type: "measured", purpose: "traverse", equipmentUsed: "Total Station", geom_kwt: 'POLYGON(())'}]

    #monuments: [{name: "338", state: "original", type: "not monumented", condition: "not found", geom_kwt: 'point(())'}]

    def initialize(cif_res)
      cif_res_xml = Nokogiri::XML(cif_res)
      cif_data = cif_res_xml.xpath("//urn1:SurveyCIFData", {"xmlns:urn1" => "urn:au:gov:qld:nrm:schema:common"}).text #xmlns:urn:GetCifResponse//urn1:SurveyCIFData
      @cif_data = Nokogiri::XML(Base64.decode64(cif_data))
      @cif_data.remove_namespaces!

      cif_image = cif_res_xml.xpath("//urn:cif-image", {"xmlns:urn" => "urn:au:gov:qld:nrm:schema:service:sip"}).text
      @cif_image = Base64.decode64(cif_image)

      @plan_detail = {}
      @parcels = []
      @observation_group = []
      @monuments = []
    end

    def run
      # create_image_pdf_file
      load_plan_detail
      load_plan_detail
      load_all_parcels

      load_observation_group
      load_monuments
    end

    private
    def load_plan_detail

      plan_detail_node = @cif_data.xpath('//Survey/SurveyHeader')[0]
      # puts plan_detail_node
      @plan_detail[:description] = plan_detail_node[:desc]
      @plan_detail[:compiled] = (plan_detail_node[:type] == "surveyed" ? "Yes" : "No")
      @plan_detail[:plan_number] = @plan_number = plan_detail_node[:name]
      @plan_detail[:field_note_flag] = plan_detail_node[:fieldNoteFlag]
      @plan_detail[:submission_date] = plan_detail_node[:submissionDate]

      #get surveyors:
      surveyors = []
      @cif_data.xpath('//Survey/SurveyHeader/Personnel').each do |survey|
       surveyors << survey[:name]
      end
      @plan_detail[:surveyors] = surveyors.join(";")

    end

    def load_all_parcels
      @cif_data.xpath('//Parcels/Parcel').each do |p|
        next unless p[:class] || p[:state]

        parcel = {}
        if p[:name].include?(@plan_number)
          p[:name].match(/\d+[a-z]+\//) ? next : parcel[:parcel_type] = 'parcel' #don't need those part parcel for that plan
        else
          parcel[:parcel_type] = 'neighbour_parcel'
        end

        parcel[:lot_plan_number] = p[:name]
        parcel[:area] = p[:area]
        parcel[:format] = p[:parcelFormat]
        parcel[:klass] = p[:class]
        # parcel[:type] = p[:parcelType]
        parcel[:description] = p[:desc]
        parcel[:state] = p[:state]

        point_coords = []
        points = []
        p.children.each do |child|
          parcel[:title] = child[:name] if child.name == "Title"
          if child.name == "CoordGeom"
            child.children.each do |c|
              c.children.each do |t|
                if (ref = t[:pntRef]) == points[-1] #the joints
                  point_coords << point_coords[-1]
                else
                  point_coords << @cif_data.xpath("//CgPoints/CgPoint[@name='#{ref}']").children[0].text
                end
                points << ref
              end
            end
            # parcel[:geom_kwt] = "POLYGON((#{point_coords.join(',')}))" unless point_coords.empty?
            unless point_coords.empty?
              parcel[:geom_kwt] = "POLYGON((#{point_coords.join(',')}))"
              File.open("geom.txt", "a") {|f| f.puts "#{parcel[:lot_plan_number]}|#{parcel[:geom_kwt]}" }
            end

          end
        end
        @parcels << parcel
      end
    end


    def create_image_pdf_file
      cif_image_tiff_file = "cif_image.tiff"
      cif_image_pdf_file = "cif_image.pdf"

      File.open(cif_image_tiff_file, "w") {|f| f.puts  @cif_image}

      Shell.execute_cmd("nice -n 19 tiff2pdf #{cif_image_tiff_file} > #{cif_image_pdf_file}")
      info = `tiffinfo #{cif_image_tiff_file}`
      #some tiff's have bad color registration
      unless info.include?("Photometric Interpretation")
        raise "UNKNOWN FILE FORMAT - Bad colour registration - #{cif_image_tiff_file}"
      end
    end

    def load_observation_group
      @cif_data.xpath('//ObservationGroup/ReducedObservation').each do |o|
        observation = {}#: [{name: "4966", azimuth: "270",
                             # horiz_distance: "90.523", distance_type: "measured", azimuth_type: "measured", purpose: "traverse", equipmentUsed: "Total Station", geom_kwt: string}]
        observation[:name]            = o[:name]
        observation[:azimuth]         = o[:azimuth]
        observation[:horiz_distance]  = o[:horizDistance]
        observation[:distance_type]   = o[:distanceType]
        observation[:azimuth_type]    = o[:azimuthType]
        observation[:purpose]         = o[:purpose]
        observation[:equipmentUsed]   = o[:equipmentUsed]

        point_refs = []
        point_refs << @cif_data.xpath("//InstrumentSetup[@id='#{o[:setupID]}']").children[0][:pntRef]
        point_refs << @cif_data.xpath("//InstrumentSetup[@id='#{o[:targetSetupID]}']").children[0][:pntRef]

        point_coords = point_refs.inject([]) do |coords, ref|
          coords << @cif_data.xpath("//CgPoints/CgPoint[@name='#{ref}']").children[0].text
          coords
        end
        observation[:geom_kwt] = "LINE((#{point_coords.join(',')}))"

        @observation_group << observation

      end
    end

    def load_monuments
      @cif_data.xpath('//Monuments/Monument').each do |m|
        monument = {}#: [{name: "338", state: "original", type: "not monumented", condition: "not found", geom_kwt: string}]
        monument[:name]            = m[:name]
        monument[:state]           = m[:state]
        monument[:type]            = m[:type]
        monument[:condition]       = m[:condition]

        point_coord = @cif_data.xpath("//CgPoints/CgPoint[@name='#{m[:pntRef]}']").children[0].text
        monument[:geom_kwt] = "POINT((#{point_coord}))"

        @monuments << monument
      end
    end

  end

# end