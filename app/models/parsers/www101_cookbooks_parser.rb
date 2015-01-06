require 'striplines'

module Parsers
  class WWW101CookbooksParser < HTMLParser
    def title
      recipe_html.at_css('h1').text
    end

    def notes
      recipe_html.at_css('h1 + p').try(:text)
    end

    def ingredients
      recipe_html.at_css('blockquote').text.strip.striplines
    end

    def instructions
      recipe_html.css('blockquote ~ p:not(.recipeend)').map(&:text).join("\n\n").strip.striplines
    end

    private

    def recipe_html
      @recipe_html ||= html.at_css('#recipe')
    end
  end
end
