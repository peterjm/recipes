class AddPositionToRecipeIngredients < ActiveRecord::Migration[4.2]
  def change
    add_column :recipe_ingredients, :position, :integer, default: 0, null: false
  end
end
