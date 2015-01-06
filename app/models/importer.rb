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
    Recipe.new(parser.parse)
  end

  def import!
    import.tap(&:save!)
  end

  private

  def content
    @content ||= fetcher.get(url)
  end

  def parser
    HTMLParser.build(url, content)
  end

end
