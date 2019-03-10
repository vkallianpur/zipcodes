class ZipcodesController < ApplicationController

  require 'json'
  require 'open-uri'
  require 'ostruct'

  def index
	@zipcode_details = nil;
    @zip_code = params[:zip_code]
    if @zip_code.present?
	  url = "http://11ed369a.ngrok.io/api/hud/zipcodes/" + @zip_code
  	  
	  begin
	  	  @zipcode_details = JSON.parse(open(url).read, object_class: OpenStruct)
	  rescue OpenURI::HTTPError => error
		if error.io.status[0] == "400"
		  @error_message = "Please specify a valid zip code."	
		else
		  @error_message = "Could not find zip code details."	
		end
	  end  
	end
  end
end

