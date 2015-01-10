require 'data_uri'
require 'data_uri/open_uri'
require 'open-uri'

class DataUriFile
  attr_reader :uri

  def initialize(raw_data_uri)
    @uri = URI::Data.new(raw_data_uri)
  end

  def read
    uri.open { |io| io.read }
  end
end
