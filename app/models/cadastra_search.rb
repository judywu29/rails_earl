
require 'cadastra_xml_parser'

class CadastraSearch < ActiveRecord::Base

  has_many :monuments, dependent: :destroy
  has_many :parcels, dependent: :destroy
  has_many :plan_details, dependent: :destroy


  def load_to_db(parser)
    parser.plan_details.each do |detail|
      self.plan_details << plan_detail = PlanDetail.create!(:plan_number=>detail[:plan_number],
                                                            :description=>detail[:description],
                                                            :submission_date=>detail[:submission_date],
                                                            :compiled=>detail[:compiled],
                                                            :field_note_flag=>detail[:field_note_flag],
                                                            :surveyor=>detail[:surveyor],
                                                            :lots =>detail[:lots].join("|"),
                                                            :linkage_plan_numbers => detail[:linkage_plan_numbers].join("|"))

    end

    parser.parcels.each do |p|
      self.parcels << parcel = Parcel.create!(:lot_plan_number => p[:lot_plan_number],
                                              :area => p[:area],
                                              :format => p[:format],
                                              :klass => p[:klass],
                                              :state => p[:state],
                                              :description => p[:description],
                                              :title => p[:title],
                                              :geom => p[:geom_kwt],
                                              :linkage_parcel_numbers => p[:linkage_parcel_numbers].join("|"))
      # p[:identity_plan_numbers].each do |plan_number|
      #   parser.plan_details.each {|d| d[:plan_number] == plan_number}
      # end
    end
    parser.monuments.each do |m|
      self.monuments << Monument.create!(:name => m[:name],
                                          :state =>m[:state],
                                          :monument_type => m[:monument_type],
                                          :condition => m[:condition],
                                          :geom => m[:geom_kwt])
    end
  end

  def cadastra_data_search(lot_plan_list)
    # cadastra_res = File.open(File.dirname(__FILE__) + "/cadastra_cif_res_RP7721.xml")
    curl_soap = CurlSoap.new({:soap_url=>CADASTRA_SOAP_URL, :host=>HOST, :port=>PORT})
    cadastra_res = curl_soap.request('cadastral_search', { :lot_plans=> lot_plan_list })


    parser = CadastraXmlParser.new(cadastra_res)
    parser.run

   load_to_db(parser)
  end
end
