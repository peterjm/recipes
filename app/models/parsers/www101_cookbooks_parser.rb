require 'striplines'

module Parsers
  class WWW101CookbooksParser
    def initialize(content)
      @content = content
    end

    def title
      recipe.at_css('h1').text
    end

    def notes
      recipe.at_css('h1 + p').try(:text)
    end

    def ingredients
      recipe.at_css('blockquote').text.strip.striplines
    end

    def instructions
      recipe.css('blockquote ~ p:not(.recipeend)').map(&:text).join("\n\n").strip.striplines
    end

    private

    def recipe
      @recipe ||= html.at_css('#recipe')
    end

    def html
      @html ||= Nokogiri::HTML(@content)
    end
  end
end
