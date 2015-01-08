require 'test_helper'

class HTMLParserTest < ActiveSupport::TestCase
  test ".build returns a parser instance" do
    parser = HTMLParser.build("http://www.101cookbooks.com/", "<html></html>")
    assert parser.is_a?(HTMLParser)
  end

  test ".parser_for works for 101 Cookbooks" do
    assert_equal Parsers::WWW101CookbooksParser, HTMLParser.parser_for("http://www.101cookbooks.com/")
  end
end
