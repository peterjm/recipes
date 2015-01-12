require 'test_helper'

class IngredientLinePresenterTest < ActiveSupport::TestCase

  test "#ingredient_path is the path to the ingredient" do
    p = presenter
    assert_equal "/ingredients/1-tomatoes", p.ingredient_path
  end

  def presenter
    ing = create(:recipe_ingredient)
    p = IngredientLinePresenter.new(ing)
  end

end
