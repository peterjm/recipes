require 'striplines'

module Parsers
  class HTMLParser
    def self.build(source_url, content)
      parser_for(source_url).new(content)
    end

    def self.parser_for(source_url)
      case source_url
      when /www.101cookbooks.com/
        WWW101CookbooksParser
      else
        raise "unknown source"
      end
    end

    def initialize(content)
      @content = content
    end

    def parse
      {
        title: title,
        notes: notes,
        ingredients_text: ingredients,
        instructions_text: instructions
      }
    end

    [:title, :notes, :ingredients, :instructions].each do |m|
      define_method m do
        raise NotImplementedError.new("#{m} must be implemented by subclass")
      end
    end

    protected

    def html
      @html ||= Nokogiri::HTML(@content)
    end
  end
end
