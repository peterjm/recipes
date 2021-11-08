require 'test_helper'

class HtmlFetcherTest < ActiveSupport::TestCase

  test "#get returns the content from the given URL" do
    content = "<html>content</html>"
    stub_request(:get, "http://www.example.com").to_return(body: content)
    fetcher = HtmlFetcher.new
    assert_equal content, fetcher.get("http://www.example.com")
  end

end
