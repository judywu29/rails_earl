require 'cif_xml_parser'

class QldLotPlanSearch < ActiveRecord::Base


  def self.cif_parser(plan_number)
    curl_soap = CurlSoap.new({:soap_url=>CADASTRA_SOAP_URL, :host=>HOST, :port=>PORT})
    cif_res = curl_soap.request('cif_search', { plan_number: plan_number } )

    parser = CifXmlParser.new(cif_res)
    parser.run

    parser
  end
end
