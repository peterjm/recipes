require 'striplines'

module Parsers
  class HTMLParser
    def initialize(content)
      @content = content
    end

    protected

    def html
      @html ||= Nokogiri::HTML(@content)
    end
  end
end
