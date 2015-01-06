require 'net/http'
require 'uri'

class HTMLFetcher

  def get(url)
    uri = URI.parse(url)
    Net::HTTP.get(uri)
  end

end
