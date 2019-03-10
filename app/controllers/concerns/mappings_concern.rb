module MappingsConcern
  extend ActiveSupport::Concern
  
  require "uri"
  require "net/http"
  require "net/http/post/multipart"
  
  included do
    helper_method :upload_file
  end

 def upload_file (mappingsUrl)
    uploaded_io = params[:file] 

    file_name = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    File.open(file_name, 'wb') do |file|
     file.write(uploaded_io.read)
    end	

    url = URI.parse(mappingsUrl)
	
    File.open(file_name) do |csv|
      req = Net::HTTP::Post::Multipart.new url.path,
        "file" => UploadIO.new(csv, "text/plain", uploaded_io.original_filename)
      res = Net::HTTP.start(url.host, url.port) do |http|
        upload_result = http.request(req)

        if upload_result.code != "200"
	      redirect_to({ action: 'index' }, alert: "Mappings were not updated. Please make sure file contains valid mappings.") and return
		end
      end
    end

    redirect_to({ action: 'index' }, notice: "Mappings were successfully updated.")
  end
end