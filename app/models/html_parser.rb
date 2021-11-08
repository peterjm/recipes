class HtmlParser
  RECIPE_FIELDS = [:title, :instructions, :ingredients, :image_url]

  def self.build(source_url, content)
    parser_for(source_url).new(source_url, content)
  end

  def self.parser_for(source_url)
    case source_url
    when /www.101cookbooks.com/
      Parsers::Www101CookbooksParser
    else
      raise "unknown source"
    end
  end

  def initialize(url, content)
    @url = url
    @content = content
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
