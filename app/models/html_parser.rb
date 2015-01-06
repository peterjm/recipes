require 'striplines'

class HTMLParser
  RECIPE_FIELDS = [:title, :instructions_text, :ingredients_text]

  def self.build(source_url, content)
    parser_for(source_url).new(content)
  end

  def self.parser_for(source_url)
    case source_url
    when /www.101cookbooks.com/
      Parsers::WWW101CookbooksParser
    else
      raise "unknown source"
    end
  end

  def initialize(content)
    @content = content
  end

  def parse
    RECIPE_FIELDS.each_with_object({}) do |field, attrs|
      attrs[field] = public_send(field)
    end
  end

  RECIPE_FIELDS.each do |m|
    define_method m do
      raise NotImplementedError.new("#{m} must be implemented by subclass")
    end
  end

  protected

  def html
    @html ||= Nokogiri::HTML(@content)
  end
end
