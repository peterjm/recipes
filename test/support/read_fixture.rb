class ActiveSupport::TestCase

  def read_fixture(fixture)
    path = File.join(Rails.root, 'test/fixtures', fixture)
    File.open(path) { |f| f.read }
  end

end
