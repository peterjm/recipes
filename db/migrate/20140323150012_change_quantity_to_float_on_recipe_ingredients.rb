class ChangeQuantityToFloatOnRecipeIngredients < ActiveRecord::Migration
  def change
    change_column :recipe_ingredients, :quantity, :float, null: false
  end
end
