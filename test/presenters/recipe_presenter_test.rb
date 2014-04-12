require 'test_helper'

class RecipePresenterTest < ActiveSupport::TestCase

  test "#ingredients_markdown links to ingredients" do
    recipe = create(:recipe).tap(&:update_recipe_ingredients)
    p = RecipePresenter.new(recipe)
    expected =  <<-ING.strip_heredoc
      1 cup [flour](/ingredients/1-flour)
      [yeast](/ingredients/2-yeast)
      [pizza sauce](/ingredients/3-pizza-sauce)
      [mushrooms](/ingredients/4-mushrooms)
    ING
    assert_equal expected, p.ingredients_markdown
  end

end
