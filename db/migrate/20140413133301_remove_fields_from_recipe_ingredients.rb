class RemoveFieldsFromRecipeIngredients < ActiveRecord::Migration
  def change
    remove_column :recipe_ingredients, :quantity, :string
    remove_column :recipe_ingredients, :style, :string
    remove_column :recipe_ingredients, :unit, :string, null: false
  end
end
