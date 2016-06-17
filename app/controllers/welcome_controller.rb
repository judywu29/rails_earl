require 'json'

class WelcomeController < ApplicationController
  def index

    # # json_file = Rails.root.join('app/spec/fixtures/movie-network-data.json')
    # file_name = File.dirname(__FILE__) + "/movie-network-data.json"
    # # logger.debug file
    # @json_data = JSON.load(IO.read(file_name, encoding:'utf-8') ).to_json
    # logger.debug @json_data
  end
end
