require 'test_helper'

class ImporterTest < ActiveSupport::TestCase

  def parser(attrs={})
    @parser ||= begin
      p = stub(parse: attrs)
      HTMLParser.stubs(:build).returns(p)
      p
    end
  end

  def fetcher(content="whatever")
    @fetcher ||= stub(get: content)
  end

  test "#import returns a recipe" do
    parser(
      title: "the title",
      instructions_text: "the instructions",
      ingredients_text: "the ingredients"
    )
    fetcher = stub
    fetcher.expects(:get).with("http://foo.com").returns("content")
    HTMLParser.expects(:build).with("http://foo.com", "content").returns(parser)
    importer = Importer.new("http://foo.com", fetcher: fetcher)
    recipe = importer.import

    assert_equal "the title", recipe.title
    assert_equal "the instructions", recipe.instructions_text
    assert_equal "the ingredients", recipe.ingredients_text
  end

  test "#import sets the source on the recipe" do
    url = "http://foo.com"
    parser
    importer = Importer.new(url, fetcher: fetcher)
    recipe = importer.import
    assert_equal url, recipe.source
  end

end
