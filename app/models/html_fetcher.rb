require 'net/http'
require 'uri'

class HtmlFetcher

  def get(url)
    uri = URI.parse(url)
    Net::HTTP.get(uri)
  end

end
