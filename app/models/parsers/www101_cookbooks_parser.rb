module Parsers
  class WWW101CookbooksParser < HTMLParser

    SOURCE_NAME = "101 Cookbooks"

    def title
      recipe_html.at_css('h1').text
    end

    def notes
      recipe_html.at_css('h1 + p').try(:text)
    end

    def ingredients
      recipe_html.at_css('blockquote').text.striplines
    end

    def instructions
      recipe_html.css('blockquote ~ p:not(.recipeend)').map(&:text).join("\n\n").striplines
    end

    def image_urls
      imgs = html.css('#maincontent .mainimagewide img') + html.css('#maincontent .entrybody p img')
      imgs.map{|img| full_url(img.attr('src'))}
    end

    def source
      @source ||= WebsiteSource.find_by(name: SOURCE_NAME)
    end

    private

    def recipe_html
      @recipe_html ||= html.at_css('#recipe')
    end
  end
end
