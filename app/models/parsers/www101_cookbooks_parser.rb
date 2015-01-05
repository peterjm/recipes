module Parsers
  class WWW101CookbooksParser
    def initialize(content)
      @content = content
    end

    def title
      recipe.at_css('h1').text
    end

    def notes
      #recipe.querySelector('h1 + p')?.textContent
    end

    def ingredients
      #recipe.querySelector('blockquote').textContent
    end

    def instructions
      #(p.textContent for p in recipe.querySelectorAll('blockquote ~ p:not(.recipeend)')).join("\n\n")
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
