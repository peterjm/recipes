class Importer

  def self.import_from_url(url)
    new(url).import
  end

  attr_reader :url, :fetcher

  def initialize(url, fetcher: HtmlFetcher.new)
    @url = url
    @fetcher = fetcher
  end

  def import
    Recipe.new(attrs)
  end

  def import!
    Recipe.create!(attrs)
  end

  private

  def attrs
    {
      title: parser.title,
      instructions_text: parser.instructions,
      ingredients_text: parser.ingredients,
      notes: parser.notes,
      images_attributes: parser.image_urls.map{|img| {source_image_url: img}},
      basic_source: url,
      source: parser.source
    }
  end

  def content
    @content ||= fetcher.get(url)
  end

  def parser
    HtmlParser.build(url, content)
  end

end
