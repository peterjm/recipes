class ChangeQuantityToFloatOnRecipeIngredients < ActiveRecord::Migration[4.2]
  def change
    change_column :recipe_ingredients, :quantity, :float, null: false
  end
end
