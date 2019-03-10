class ZiptocbsamappingsController < ApplicationController
  include MappingsConcern

  def index
  end
  
  def upload
    upload_file "http://11ed369a.ngrok.io/api/hud/mappings/ziptocbsa"
  end
end
