require 'test_helper'

class RecipeIngredientPresenterTest < ActiveSupport::TestCase

  test "#markdown includes a link to the ingredient" do
    p = presenter
    assert_match %r{\[#{p.name}\]\(#{p.ingredient_path}\)}, p.markdown
  end

  test "#ingredient_path is the path to the ingredient" do
    p = presenter
    assert_equal "/ingredients/1-tomatoes", p.ingredient_path
  end

  def presenter
    ing = create(:recipe_ingredient)
    p = RecipeIngredientPresenter.new(ing)
  end

end
