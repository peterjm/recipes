class ActiveSupport::TestCase

  def read_fixture(fixture)
    File.open(fixture_filepath(fixture)) { |f| f.read }
  end

  def fixture_filepath(fixture)
    File.join(Rails.root, 'test/fixtures', fixture)
  end

end
