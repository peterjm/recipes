require 'test_helper'

class ImporterTest < ActiveSupport::TestCase

  def default_attrs
    {
      title: "",
      instructions: "",
      ingredients: "",
      image_urls: [""],
      notes: "",
      source: source
    }
  end

  def source
    @source ||= Source.new
  end

  def parser(attrs={})
    attrs = default_attrs.merge(attrs)
    @parser ||= begin
      p = stub(attrs)
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
      instructions: "the instructions",
      ingredients: "the ingredients",
      image_urls: ["http://foo.com/img.jpg"],
      notes: "the notes"
    )
    fetcher = stub
    fetcher.expects(:get).with("http://foo.com").returns("content")
    HTMLParser.expects(:build).with("http://foo.com", "content").returns(parser)
    importer = Importer.new("http://foo.com", fetcher: fetcher)
    recipe = importer.import

    assert_equal "the title", recipe.title
    assert_equal "the instructions", recipe.instructions_text
    assert_equal "the ingredients", recipe.ingredients_text
    assert_equal "http://foo.com/img.jpg", recipe.images.first.remote_image_url
    assert_equal "the notes", recipe.notes
  end

  test "#import sets the basic source on the recipe" do
    url = "http://foo.com"
    parser
    importer = Importer.new(url, fetcher: fetcher)
    recipe = importer.import
    assert_equal url, recipe.basic_source
  end

  test "#import sets the source on the recipe" do
    parser
    importer = Importer.new("http://foo.com", fetcher: fetcher)
    recipe = importer.import
    assert_equal source, recipe.source
  end

end
