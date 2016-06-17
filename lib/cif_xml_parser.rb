
require 'nokogiri'
require "base64"

require 'json'

require 'rgeo'
require 'rgeo/geo_json'

# module DnrmEarl
  class CifXmlParser

    Proj4Definitions = {
        # Custom TerriaJS entries
        "4326" =>  '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs',
        #Australia zone
        "28350" => '+proj=utm +zone=50 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs',
        "28351" => '+proj=utm +zone=51 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs',
        "28352" => '+proj=utm +zone=52 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs',
        "28353" => '+proj=utm +zone=53 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs',
        "28354" => '+proj=utm +zone=54 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs',
        "28355" => '+proj=utm +zone=55 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs',
        "28356" => '+proj=utm +zone=56 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs',
        "28357" => '+proj=utm +zone=57 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs',
        "28358" => '+proj=utm +zone=58 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'
    }



    attr_reader :cif_data, :cif_image, :plan_detail, :parcels, :plan_number, :observation_group, :monuments, :epsg_code
    #plan_detail: { plan_number: string, surveyors: names with ;, description: string, submission_date: string,compiled: Yes or No
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

      # File.open("RP704171.xml", "w") {|f| f.puts @cif_data }

      cif_image = cif_res_xml.xpath("//urn:cif-image", {"xmlns:urn" => "urn:au:gov:qld:nrm:schema:service:sip"}).text
      @cif_image = Base64.decode64(cif_image)

      @plan_detail = {}
      @parcels = []
      @observation_group = []
      @monuments = []
    end

    def run

      set_epsg_code

      create_image_pdf_file

      load_plan_detail
      load_all_parcels

      load_observation_group
      load_monuments

      # create_json_files
    end

    private

    def set_epsg_code
      (node = @cif_data.xpath('//CgPoints').first) &&  @epsg_code = "283#{node[:zoneNumber]}"
    end

    def create_json_files(file_name = "")
      #create for plans
      if file_name.empty?
        file_name = "cif_data_parsing_#{@plan_number}"
      end

      # File.open("output/#{file_name}_plans.json", "w") do |f|
      #   f << @plan_details.values.to_json
      # end

      #create for parcels
      File.open("output/#{file_name}_parcels.json", "w") do |f|
        parcels_to_json = @parcels.map { |parcel|
          { type:        "Feature",
            properties:  { lot_plan_number:    parcel[:lot_plan_number],
                           area:               parcel[:area],
                           format:             parcel[:parcelFormat],
                           klass:              parcel[:class],
                           description:        parcel[:desc],
                           state:              parcel[:state],
                           parcel_type:        parcel[:parcel_type],
                           title:              parcel[:title],
                           geom_kwt:         parcel[:geom_kwt]},
            geometry:    parcel[:geom_hash] } }
        f << parcels_to_json.to_json
      end

      #create for monuments
      File.open("output/#{file_name}_monuments.json", "w") do |f|
        monuments_to_json = @monuments.map { |monument|
          { type:        "Feature",
            properties:  { name:           monument[:name],
                           state:          monument[:state],
                           type:           monument[:type],
                           condition:      monument[:condition],
                           geom_kwt:       monument[:geom_kwt]},
            geometry:    monument[:geom_hash] } }
        f << monuments_to_json.to_json
      end


      #create for observe group
      File.open("output/#{file_name}_observation_group.json", "w") do |f|
        group_to_json = @observation_group.map { |group|
          { type:        "Feature",
            properties:  {  name:             group[:name],
                            azimuth:          group[:azimuth],
                            horiz_distance:   group[:horizDistance],
                            distance_type:    group[:distanceType],
                            azimuth_type:     group[:azimuthType],
                            purpose:          group[:purpose],
                            equipmentUsed:    group[:equipmentUsed],
                            geom_kwt:         group[:geom_kwt]},
            geometry:    group[:geom_hash] } }
        f << group_to_json.to_json
      end

    end

    def load_plan_detail
      plan_detail_node = @cif_data.xpath('//Survey/SurveyHeader')[0]

      sureyors = @cif_data.xpath('//Survey/SurveyHeader/Personnel').inject([]) do |surveyors, survey|
        surveyors << survey[:name]
        surveyors
      end.join(";")

      # puts plan_detail_node
      @plan_detail = {  plan_number:      @plan_number = plan_detail_node[:name],
                        description:      plan_detail_node[:desc],
                        compiled:         (plan_detail_node[:type] == "surveyed" ? "Yes" : "No"),
                        field_note_flag:  plan_detail_node[:fieldNoteFlag],
                        submission_date:  plan_detail_node[:submissionDate],
                        surveyors:        sureyors }
    end

    def get_title_of_parcel(lot_plan = "")
      (node = @cif_data.xpath("//Parcel[@name='#{lot_plan}']/Title/@name").first) && node.value
    end

    #land xml using northing, easting but WKT is x,y so we need to swap
    def wkt_from_cg_point_list(point)
      point.split(" ").reverse.join(" ")
    end

    def search_point_from_cgpoints(ref)
      if node = @cif_data.xpath("//CgPoints/CgPoint[@name='#{ref}']").first
        return wkt_from_cg_point_list(node.text)
      end
      return nil
    end

    def get_coords_of_parcel(lot_plan = "")
      point_coords = @cif_data.xpath("//Parcel[@name='#{lot_plan}']/CoordGeom/Line/Start/@pntRef").inject([]) do |coords, pnt|
        (coord = search_point_from_cgpoints(pnt)) && (coords += [coord] * 2)
        coords
      end
      point_coords.empty? ? "" : "POLYGON((#{point_coords.push(point_coords.shift).join(',')}))"
    end

    def convert_geom_kwt_to_geo_hash(geom_kwt)
      return nil if geom_kwt.empty?
      # puts @epsg_code
      # puts RGeo::Geos.supported?
      # puts RGeo::CoordSys::Proj4.supported?
      if proj4 = Proj4Definitions[@epsg_code]
        #   puts proj4.inspect
        epsg_2385x = RGeo::Geos.factory(proj4: proj4, srid: @epsg_code.to_i)
        proj_point = epsg_2385x.parse_wkt(geom_kwt)
        epsg_4326 = RGeo::Geos.factory(proj4: Proj4Definitions["4326"], srid: 4326)
        geo_point = RGeo::CoordSys::Proj4.transform(epsg_2385x.proj4, proj_point, epsg_4326.proj4, epsg_4326)
        geo_hash = RGeo::GeoJSON.encode(geo_point)
        #change decimal precision, x: y all 15 digits
        #polygons:
        geo_hash["coordinates"].map! { |arr| arr.map! { |x, y|  [x.round(12), y.round(13)] }} if geo_hash["type"] == 'Polygon'

        geo_hash["coordinates"] = [geo_hash["coordinates"][0].round(12), geo_hash["coordinates"][1].round(13)] if geo_hash["type"] == 'Point'
        geo_hash
      end
    end

    def load_all_parcels
      @cif_data.xpath('//Parcels/Parcel').each do |p|
        lot_plan = p[:name]
        next unless p[:class] || p[:state] || !lot_plan.include?("/")

        if lot_plan.include?(@plan_number)
          lot_plan.match(/\d+[a-z]+\//) ? next : parcel_type = 'parcel' #don't need those part parcel for that plan
        else
          parcel_type = 'neighbour_parcel'
        end
        geom_kwt = get_coords_of_parcel(lot_plan)

        @parcels << { lot_plan_number:    lot_plan,
                      area:               p[:area],
                      format:             p[:parcelFormat],
                      klass:              p[:class],
                      description:        p[:desc],
                      state:              p[:state],
                      parcel_type:        parcel_type,
                      title:              get_title_of_parcel(lot_plan),
                      geom_kwt:           geom_kwt,
                      geom_hash:          convert_geom_kwt_to_geo_hash(geom_kwt) }
      end
    end


    def create_image_pdf_file
      cif_image_pdf_file = "cif_image_test.pdf"
      File.open(cif_image_pdf_file, "w") {|f| f.puts  @cif_image}
    end

    def load_observation_group
      @cif_data.xpath('//ObservationGroup/ReducedObservation').each do |o|

        point_coords = []
        if (setup_point = @cif_data.xpath("//InstrumentSetup[@id='#{o[:setupID]}']").first) &&
            (target_point = @cif_data.xpath("//InstrumentSetup[@id='#{o[:targetSetupID]}']").first)
          (coord = search_point_from_cgpoints(setup_point[:pntRef])) && (point_coords << coord)
          (coord = search_point_from_cgpoints(target_point[:pntRef])) && (point_coords << coord)
        end

        geom_kwt = point_coords.empty? ? "" : "LINE((#{point_coords.join(',')}))"
        @observation_group << { name:             o[:name],
                                azimuth:          o[:azimuth],
                                horiz_distance:   o[:horizDistance],
                                distance_type:    o[:distanceType],
                                azimuth_type:     o[:azimuthType],
                                purpose:          o[:purpose],
                                equipmentUsed:    o[:equipmentUsed],
                                geom_kwt:         geom_kwt,
                                geom_hash:        convert_geom_kwt_to_geo_hash(geom_kwt)}

      end
    end

    def load_monuments
      @cif_data.xpath('//Monuments/Monument').each do |m|
        coord = search_point_from_cgpoints(m[:pntRef])
        geom_kwt = coord.nil? ? "" : "POINT((#{point_coord}))"

        @monuments <<  { name:          m[:name],
                         state:         m[:state],
                         type:          m[:type],
                         condition:     m[:condition],
                         geom_kwt:      geom_kwt,
                         geom_hash:     convert_geom_kwt_to_geo_hash(geom_kwt) }

      end
    end

  end

# end

# #
# #
# cif_res = File.open("input/csv_res_SP201240.xml")
# cif_res = File.open("input/csv_res_RP846863.xml")
# cif_res = File.open("input/csv_res_RP704171.xml")
# # #
# # # # cadastra_res = File.open("input/rp7721.xml")
# # # # #
# # # # # # cadastra_res = File.open("cadastra_data_search_gdapoints.xml")
# # # # #
# parser = DnrmEarl::CifXmlParser.new(cif_res)
# parser.run