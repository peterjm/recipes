require 'file_data_uri'

class ActiveSupport::TestCase

  def data_uri_from_fixture(fixture)
    FileDataUri.from fixture_filepath("data/#{fixture}")
  end

end
