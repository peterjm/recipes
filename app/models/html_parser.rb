require 'striplines'

class HTMLParser
  RECIPE_FIELDS = [:title, :instructions_text, :ingredients_text, :image_url]

  def self.build(source_url, content)
    parser_for(source_url).new(source_url, content)
  end

  def self.parser_for(source_url)
    case source_url
    when /www.101cookbooks.com/
      Parsers::WWW101CookbooksParser
    else
      raise "unknown source"
    end
  end

  def initialize(url, content)
    @url = url
    @content = content
  end

  def parse
    RECIPE_FIELDS.each_with_object({}) do |field, attrs|
      attrs[field] = public_send(field)
    end
  end

  def image_url
    image_urls.first
  end

  def image_urls
    []
  end

  protected

  def full_url(relative_url)
    URI.join(@url, relative_url).to_s
  end

  def html
    @html ||= Nokogiri::HTML(@content)
  end
end
