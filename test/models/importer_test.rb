require 'test_helper'

class ImporterTest < ActiveSupport::TestCase

  test "#import returns a recipe" do
    parser = stub(parse: {
      title: "the title",
      instructions_text: "the instructions",
      ingredients_text: "the ingredients"
    })
    fetcher = stub
    fetcher.expects(:get).with("http://foo.com").returns("content")
    HTMLParser.expects(:build).with("http://foo.com", "content").returns(parser)
    importer = Importer.new("http://foo.com", fetcher: fetcher)
    recipe = importer.import

    assert_equal "the title", recipe.title
    assert_equal "the instructions", recipe.instructions_text
    assert_equal "the ingredients", recipe.ingredients_text
  end

end
