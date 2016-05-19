


require 'curb'

# module DnrmEarl
  class CurlSoap

    attr_reader :curl, :soap_action
    def initialize(soap_info = {})
      @curl = Curl::Easy.new(soap_info[:soap_url]) do |curl|
        curl.ssl_verify_peer = false
        curl.headers["User-Agent"] = ""
        curl.headers["Accept"] = ""
        curl.headers["Content-Type"] = "text/xml; charset=UTF-8"
        curl.headers["Host"] =  "#{soap_info[:host]}:#{soap_info[:port]}"

        curl.headers["SOAPAction"] = '""' #has to be empty
        curl.verbose = true
      end
    end

    # def set_soap_action(action = "")
    #   @soap_action = action
    # end

    def request(request, options = {})
      # @request = request
      soap_body = case request
        when /cif_search/i
          cif_search_body(options)
        when /cadastral_search/i
          cadastral_search_body(options)
        when /survey_control_file_search/i
          survey_control_file_search_body(options)
      end

      @curl.post_body = build_xml_content(soap_body)
      puts @curl.post_body
      @curl.http_post
      xml = Nokogiri::XML(res = @curl.body_str)
      File.open("cadastra_cif_res_SP132927.xml", "a") {|f| f.puts res }
      puts res

      success_status = xml.xpath("//urn1:ResponseStatus/urn1:ReturnCode", {"xmlns:urn1" => "urn:au:gov:qld:nrm:schema:util"}).text
      (success_status == "Success") ? res : ""
    end

    private

    def soap_namespace
      <<EOF
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="urn:au:gov:qld:nrm:schema:service:sip" xmlns:ns2="urn:au:gov:qld:nrm:schema:sip:common" xmlns:ns3="urn:au:gov:qld:nrm:schema:common" xmlns:ns4="http://derm.qld.gov.au/service/land/survey/CadastralDataService/1/soap" xmlns:ns5="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
EOF
    end

    def soap_header(header = "")
      <<EOF
<soap:Header><ns5:Security soap:mustUnderstand="1"><ns5:UsernameToken><ns5:Username>earl_globalx</ns5:Username><ns5:Password>inahvk1T</ns5:Password></ns5:UsernameToken></ns5:Security></soap:Header>
EOF
    end

    def build_xml_content(body)
      puts "body: #{body}"
      content = '<?xml version="1.0" encoding="utf-8"?>'
      content += soap_namespace.strip.chomp
      content += soap_header.strip.chomp
      content += "<soap:Body>#{body.strip.chomp}</soap:Body>"
      content += "</soap:Envelope>"
    end

    def cif_search_body(options = {})
      body = "<ns4:getCif><ns1:GetCifRequest><ns2:SurveyPlanNumber>"
      body += options[:plan_number]
      body += "</ns2:SurveyPlanNumber></ns1:GetCifRequest></ns4:getCif>"
    end

    def cadastral_search_body(options = {})
      body = "<ns4:cadastralSearch><ns1:CadastralSearchRequest><ns2:Buffer>500</ns2:Buffer><ns1:LotPlan>"
      options[:lot_plans].each do |lot_plan|
        lot, plan = lot_plan.split("/")
        body += "<ns2:Lot><ns2:LotNumber>#{lot}</ns2:LotNumber><ns2:PlanNumber>#{plan}</ns2:PlanNumber></ns2:Lot>"
      end
      body += "</ns1:LotPlan></ns1:CadastralSearchRequest></ns4:cadastralSearch>"
    end

    def survey_control_file_search_body(options = {})
      body="<ns4:getSurveyControlFile><ns1:SurveyControlFileRequest><ns1:MarkIdentifier>"
      body += "#{options[:mark_id]}</ns1:MarkIdentifier><ns1:RetrieveHistory>#{options[:retrieve_history]}</ns1:RetrieveHistory>"
      body += "<ns2:IncludeImage>true</ns2:IncludeImage><ns3:ImageFormat>PDF</ns3:ImageFormat></ns1:SurveyControlFileRequest></ns4:getSurveyControlFile>"
    end
  end
# end
