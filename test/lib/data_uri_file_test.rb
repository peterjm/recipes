require 'lib_test_helper'
require 'data_uri_file'

class DataUriFileTest < ActiveSupport::TestCase

  def data_uri_content(content)
    "data:text/plain;base64,#{Base64.encode64(content).chop}"
  end

  test "#read returns the content" do
    data_uri = DataUriFile.new(data_uri_content("hello world"))
    assert_equal "hello world", data_uri.read
  end

end
