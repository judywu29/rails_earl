require 'cif_xml_parser'

class QldLotPlanSearch < ActiveRecord::Base


  def self.cif_parser(lot_plan_number)
    cif_res = File.open(File.dirname(__FILE__) + "/cif_response.xml")
    parser = DnrmEarl::CifXmlParser.new(cif_res)
    parser.run

    parser
  end
end
