require 'test_helper'

class Parsers::WWW101CookbooksParserTest < ActiveSupport::TestCase

  def html(fixture)
    read_fixture("html/www101cookbooks/#{fixture}.html")
  end

  def parser(fixture)
    Parsers::WWW101CookbooksParser.new(html(fixture))
  end

  def salad_parser
    @salad_parser ||= parser("lacinato-kale-and-pecorino-salad-recipe")
  end

  def cookie_parser
    @cookie_parser ||= parser("rosewater-shortbread-recipe")
  end

  def shandy_parser
    @shandy_parser ||= parser("winter-shandy-punch-recipe")
  end

  test "#title returns the title" do
    assert_equal "Lacinato Kale and Pecorino Salad", salad_parser.title
    assert_equal "Rosewater Shortbread", cookie_parser.title
    assert_equal "Winter Shandy Punch", shandy_parser.title
  end

end
