require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  test "is valid" do
    assert build(:ingredient).valid?, "should be valid"
  end

  test "isn't valid without name" do
    refute build(:ingredient, name: nil).valid?, "should not be valid"
  end

  test "requires the name to be unique" do
    create(:ingredient, name: "tomatoes")
    refute build(:ingredient, name: "tomatoes").valid?, "should not be valid"
  end
end
