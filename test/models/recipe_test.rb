require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "is valid" do
    assert build(:recipe).valid?, "should be valid"
  end

  test "isn't valid without title" do
    refute build(:recipe, title: nil).valid?, "should not be valid"
  end
end
