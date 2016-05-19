
require 'nokogiri'
require "base64"

# module DnrmEarl
  class CadastraXmlParser

    attr_reader :cif_data, :plan_details, :parcels, :observation_group, :monuments
    #plan_detail: [{ plan_number: string, surveyor: names with ;, description: string, submission_date: string,compiled: Yes or No
    #         field_note_flag: string, lots: [], linkage_plan_numbers: []}]
    #parcels: [{ lot_plan_number: string, area: string, format: string, klass: string, state: string, type: string, description: string, title: string, geom_kwt: string, parent_name:string, linkage_parcel_numbers: []}, {}, {}...]

    #monuments: [{name: "338", state: "original", type: "not monumented", condition: "not found", geom_kwt: 'point(())'}]

    def initialize(cif_res)
      cif_res_xml = Nokogiri::XML(cif_res)
      cif_data = cif_res_xml.xpath("//urn1:SurveyCIFData", {"xmlns:urn1" => "urn:au:gov:qld:nrm:schema:common"}).text #xmlns:urn:GetCifResponse//urn1:SurveyCIFData
      @cif_data = Nokogiri::XML(Base64.decode64(cif_data))
      @cif_data.remove_namespaces!

      # File.open("cadastra_cif_data_rp7721.xml", "w") {|f| f.puts Base64.decode64(cif_data) }

      @plan_details = []
      @parcels = []
      @monuments = []
    end

    def run
      load_plan_details
      load_all_parcels
      load_parcel_linkage_parcel_numbers
      load_plan_lots_and_linkage_plan_numbers
      load_monuments
    end

    private
    def load_plan_details
      @cif_data.xpath('//Survey/SurveyHeader').each do |survey|
        plan_detail = {}
        plan_detail[:description] = survey[:desc]
        # puts plan_detail[:description]
        plan_detail[:compiled] = (survey[:type] == "surveyed" ? "No" : "Yes")
        plan_detail[:plan_number] = survey[:name]
        plan_detail[:field_note_flag] = survey[:fieldNoteFlag]
        plan_detail[:submission_date] = survey[:submissionDate]
        plan_detail[:surveyor] = survey.children[0][:name]

        @plan_details << plan_detail
      end


    end

    def load_all_parcels
      @cif_data.xpath('//*[@parcelType]').each do |p|
        next if p[:name].start_with?('UNKWN')

        parcel = {}
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
          case child.name
            when "Title"
              parcel[:title] = child[:name]
            when "CoordGeom"
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
                File.open("geom_cadastra.txt", "w") {|f| f.puts "#{parcel[:lot_plan_number]}|#{parcel[:geom_kwt]}" }
              end
            when "Parcels" #to record its parent name and its identity plan indexes
              parcel[:linkage_parcel_numbers] = []
              child.children.each do |c|
                lot, plan = c[:pclRef].split("/")
                parcel[:linkage_parcel_numbers] << plan if lot.start_with?('UNKWN') && !parcel[:linkage_parcel_numbers].include?(plan)
              end
              if node = @cif_data.xpath("//Parcels/Parcel[@pclRef='#{parcel[:lot_plan_number]}']")[0]
                parcel[:parent_name] = node.parent.parent[:name]
              end
          end
        end
        @parcels << parcel
      end
    end

    def load_parcel_linkage_parcel_numbers
      @parcels.each do |parcel|
        parcel[:linkage_parcel_numbers] ||= []
        parent =  parcel[:parent_name]
        while parent do
          # puts parent
          @parcels.each do |p|
            if p[:lot_plan_number] == parent
              parcel[:linkage_parcel_numbers] << parent
              parcel[:linkage_parcel_numbers] += p[:linkage_parcel_numbers]
              parent = p[:parent_name]
              break
            end
          end
        end
        parcel[:linkage_parcel_numbers].uniq!
      end
    end


    def load_plan_lots_and_linkage_plan_numbers
      @plan_details.each do |plan|
        plan[:linkage_plan_numbers] = []
        plan[:lots] = []
        @parcels.each do |p|
          lot, plan_number = p[:lot_plan_number].split("/")
          if plan_number == plan[:plan_number]
            plan[:lots] << lot
            p[:linkage_parcel_numbers].each do |lot_plan_number|
              plan[:linkage_plan_numbers] << (lot_plan_number.include?("/") ? lot_plan_number.split("/")[1] : lot_plan_number)
            end
            plan[:linkage_plan_numbers].uniq!
          end
        end
        plan[:lots].sort_by!{|p| p.to_i}
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