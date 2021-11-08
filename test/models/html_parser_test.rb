require 'test_helper'

class HtmlParserTest < ActiveSupport::TestCase
  test ".build returns a parser instance" do
    parser = HtmlParser.build("http://www.101cookbooks.com/", "<html></html>")
    assert parser.is_a?(HtmlParser)
  end

  test ".parser_for works for 101 Cookbooks" do
    assert_equal Parsers::Www101CookbooksParser, HtmlParser.parser_for("http://www.101cookbooks.com/")
  end
end
