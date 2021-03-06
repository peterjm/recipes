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

  test ".from finds an existing ingredient" do
    tomatoes = create(:ingredient, name: "tomatoes", ensure_ingredient_name_on_save: true)
    assert_equal tomatoes, Ingredient.from("tomatoes")
  end

  test ".from build a new, unsaved ingredient" do
    tomatoes = Ingredient.from("tomatoes")
    assert_equal "tomatoes", tomatoes.name
    assert tomatoes.new_record?, "should not be saved"
  end

  test "#ensure_ingredient_name does nothing if the name already exists" do
    tomatoes = create(:ingredient, name: "tomatoes", ensure_ingredient_name_on_save: true)
    assert_no_difference "IngredientName.count" do
      tomatoes.ensure_ingredient_name
    end
  end

  test "#ensure_ingredient_name creates an ingredient name if it doesn't exist" do
    tomatoes = create(:ingredient, name: "tomatoes")
    assert_difference "IngredientName.count", 1 do
      tomatoes.ensure_ingredient_name
    end
  end
end
