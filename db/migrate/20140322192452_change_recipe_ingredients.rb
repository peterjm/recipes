class ChangeRecipeIngredients < ActiveRecord::Migration
  def change
    change_column :recipe_ingredients, :quantity, :decimal, null: false
    add_column :recipe_ingredients, :unit, :string, default: "", null: false
  end
end
