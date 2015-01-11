require 'data_uri'

class DataUriUploadedFile < ActionDispatch::Http::UploadedFile
  def initialize(*args)
    options = args.dup.extract_options! || {}
    if options[:data_uri]
      @data_uri = URI::Data.new(options[:data_uri])
      super(filename: data_uri_filename, type: data_uri_type, tempfile: data_uri_tempfile)
    else
      super(*args)
    end
  end

  private

  def data_uri_filename
    "data-uri-img.#{data_uri_extension}"
  end

  def data_uri_type
    @data_uri.content_type
  end

  def data_uri_tempfile
    Tempfile.new("data_uri-upload").tap do |f|
      f.binmode
      f << @data_uri.data
      f.rewind
    end
  end

  def data_uri_extension
    data_uri_type.split('/')[1]
  end
end
