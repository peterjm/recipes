class RemoveTextAndPositionFromRecipeIngredients < ActiveRecord::Migration
  def change
    remove_column :recipe_ingredients, :text, :string, default: "", null: false
    remove_column :recipe_ingredients, :position, :integer, default: 0, null: false
  end
end
