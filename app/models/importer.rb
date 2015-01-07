class Importer

  def self.import_from_url(url)
    new(url).import
  end

  attr_reader :url, :fetcher

  def initialize(url, fetcher: HTMLFetcher.new)
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
    parser.parse.merge(source: url)
  end

  def content
    @content ||= fetcher.get(url)
  end

  def parser
    HTMLParser.build(url, content)
  end

end