class AddPositionToRecipeIngredients < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :position, :integer, default: 0, null: false
  end
end
