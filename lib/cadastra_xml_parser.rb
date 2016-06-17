
require 'nokogiri'
require "base64"

require 'json'

# module DnrmEarl
  class CadastraXmlParser

    attr_reader :cif_data, :plan_details, :parcels, :observation_group, :monuments
    #plan_detail: [{ plan_number: string, surveyor: names with ;, description: string, submission_date: string,compiled: Yes or No
    #         field_note_flag: string, lots: [], linkage_plan_numbers: []}]
    #parcels: [{ lot_plan_number: string, area: string, format: string, klass: string, state: string, type: string, description: string, title: string, geom_kwt: string, parents:[], linkage_parcel_numbers: []}, {}, {}...]

    #monuments: [{name: "338", state: "original", type: "not monumented", condition: "not found", geom_kwt: 'point(())'}]

    def initialize(cif_res)
      cif_res_xml = Nokogiri::XML(cif_res)
      cif_data = cif_res_xml.xpath("//urn1:SurveyCIFData", {"xmlns:urn1" => "urn:au:gov:qld:nrm:schema:common"}).text #xmlns:urn:GetCifResponse//urn1:SurveyCIFData
      @cif_data = Nokogiri::XML(Base64.decode64(cif_data))
      @cif_data.remove_namespaces! #very important

      # File.open("cadastra_cif_data_rp7721.xml", "w") {|f| f.puts Base64.decode64(cif_data) }

      @plan_details = []
      @parcels = []
      @monuments = []
    end

    def run
      load_plan_details
      load_all_parcels
      load_all_linkages_of_parcels
      set_existing_parcels_of_parcels
      # @parcels.each {|p| puts p.inspect}

      load_linkages_of_plans
      # File.open("csv_plan.txt", "w") {|f| @plan_details.each {|p| f.puts p.inspect} }

      # load_all_linkages
      # puts @plan_details.inspect
      # linkage_json = @plan_details.inject({ nodes: []}) do |linkages, p|
      #   linkages[:nodes] << { index: p[:plan_number],
      #                         links: p[:linkage_plan_numbers],
      #                         plan_number_date: "#{p[:plan_number]} (#{p[:submission_date]})",
      #                         surveyor: p[:surveyor],
      #                         description: p[:description],
      #                         compiled:   p[:compiled],
      #                         field_note_flag: p[:field_note_flag] }
      #   linkages
      # end.to_json
      # puts linkage_json.inspect
      load_monuments
    end

    private
    #O(N)
    def load_plan_details
      @cif_data.xpath('//Survey/SurveyHeader').each do |survey|
        @plan_details << { plan_number:          survey[:name],
                           description:          survey[:desc],
                           compiled:             (survey[:type] == "surveyed" ? "No" : "Yes"),
                           field_note_flag:      survey[:fieldNoteFlag],
                           submission_date:      survey[:submissionDate],
                           surveyor:             survey.children[0][:name],
                           linkage_plan_numbers: [],
                           lots:                 [],
                           existing_parcels:     [] }
      end
    end

    def get_title_of_parcel(lot_plan = "")
      (node = @cif_data.xpath("//Parcel[@name='#{lot_plan}']/Title/@name").first) && node.value
    end

    def get_parent_of_parcel(lot_plan = "")
      #to get it's parents
      nodes = @cif_data.xpath("//Parcels/Parcel[@pclRef='#{lot_plan}']")

      nodes.inject([]) { |parents, node| parents << node.parent.parent[:name] }
    end

    #land xml using northing, easting but WKT is x,y so we need to swap
    def wkt_from_cg_point_list(point)
      point.split(" ").reverse.join(" ")
    end

    def get_coords_of_parcel(lot_plan = "")
      point_coords = @cif_data.xpath("//Parcel[@name='#{lot_plan}']/CoordGeom/Line/Start/@pntRef").inject([]) do |coords, pnt|
        if node = @cif_data.xpath("//CgPoints/CgPoint[@name='#{pnt}']").first
          coords << wkt_from_cg_point_list(node.text)
          coords << coords[-1]
        end
        coords
      end
      point_coords.empty? ? "" : "POLYGON((#{point_coords.push(point_coords.shift).join(',')}))"
    end

    def get_linkages_of_parcel(lot_plan = "")
      @cif_data.xpath("//Parcel[@name='#{lot_plan}']/Parcels/Parcel/@pclRef").inject([]) do |linkages, parent|
        lot, plan = parent.value.split("/")
        linkages << plan if lot.start_with?('UNKWN') && !(linkages.include?(plan) || plan.nil? || plan.empty?)
        linkages
      end
    end

    #O(N*M)
    def load_all_parcels
      @cif_data.xpath('//*[@parcelType]').each do |p|
        lot_plan = p[:name]
        next if lot_plan.start_with?('UNKWN') || !lot_plan.include?("/")
        # File.open("geom_cadastra.txt", "w") {|f| f.puts "#{lot_plan}|#{parcel[:geom_kwt]}" }
        @parcels <<  { lot_plan_number:         lot_plan,
                       area:                    p[:area],
                       format:                  p[:parcelFormat],
                       klass:                   p[:class],
                       description:             p[:desc],
                       state:                   p[:state],
                       title:                   get_title_of_parcel(lot_plan),
                       parents:                 get_parent_of_parcel(lot_plan),
                       linkage_parcel_numbers:  get_linkages_of_parcel(lot_plan), #only UNKONWN parcel
                       geom_kwt:                get_coords_of_parcel(lot_plan),
                       existing_parcels:        [] }
      end
    end

    def get_parents_and_linkages_by_plan_number(plan_numbers = [])
      #get parents and linkages of parents(plan_numbers)
      plan_numbers.inject({ parents: [], linkages: [] }) do |result, num|
        @parcels.each do |p|
          if p[:lot_plan_number] == num
            result[:parents] +=  p[:parents]
            result[:linkages] += p[:linkage_parcel_numbers]
            break
          end
        end
        result
      end
    end

    def load_all_linkages_of_parcels
      #parents can be an array and here will traverse up the parent tree to get all parents' linkages
      @parcels.each do |parcel|
        parents = parcel[:parents]
        loop {
          parents -= parcel[:linkage_parcel_numbers] #don't get repeated parents
          break if parents.empty?
          parcel[:linkage_parcel_numbers] += parents
          # puts parents.inspect
          parents_linkages = get_parents_and_linkages_by_plan_number(parents)
          parents = parents_linkages[:parents]
          parcel[:linkage_parcel_numbers] += parents_linkages[:linkages]

        }
        parcel[:linkage_parcel_numbers].uniq!
      end
    end

    def get_existing_parcels(linkage_num)
      @parcels.select{|p| p[:linkage_parcel_numbers].include?(linkage_num) && p[:state] == "existing" }.
          map{ |e| e[:lot_plan_number] }
    end

    def set_existing_parcels_of_parcels
      #set existing parcels to those extinguished parcels, searching linkage_parcel_numbers
      @parcels.each do |parcel|
        if parcel[:state] == "extinguished"
          parcel[:existing_parcels] = get_existing_parcels(parcel[:lot_plan_number])
        elsif parcel[:state] == "existing"
          parcel[:existing_parcels] << parcel[:lot_plan_number] #add itself if it's existing
        end
      end
    end

    #O(n*2)
    def load_linkages_of_plans
      #add all of its linkages from different lots
      @plan_details.each do |plan|
        plan_number = plan[:plan_number]
        @parcels.each do |p|
          if (lot_plan = p[:lot_plan_number]).include?(plan_number)
            plan[:lots] << p[:lot_plan_number].split("/")[0]
            plan[:linkage_plan_numbers] += p[:linkage_parcel_numbers].map{ |lot_plan_number| lot_plan_number.include?("/") ? lot_plan_number.split("/")[1] : lot_plan_number }
            plan[:existing_parcels] += p[:existing_parcels]
          end
        end
        #have to look up the parcels again for those unknown parcel which are not in parcels but in plan details
        plan[:existing_parcels] = get_existing_parcels(plan_number) if plan[:existing_parcels].empty?

        plan[:linkage_plan_numbers] -= [plan_number]
        plan[:linkage_plan_numbers].unshift(plan_number).uniq!

        plan[:lots].sort_by!{|p| p.to_i}
        plan[:existing_parcels].uniq!
      end
    end

    def load_monuments
      @cif_data.xpath('//Monuments/Monument').each do |m|
        point_coord = ((node = @cif_data.xpath("//CgPoints/CgPoint[@name='#{m[:pntRef]}']").first) && node.text)

        @monuments <<  {  name:           m[:name],
                          state:          m[:state],
                          type:           m[:type],
                          condition:      m[:condition],
                          geom_kwt:       "POINT((#{point_coord}))" }       #: [{name: "338", state: "original", type: "not monumented", condition: "not found", geom_kwt: string}]
      end
    end

  end

# end


# end
