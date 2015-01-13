class AddNameToRecipeIngredients < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :name, :string, default: "", null: false
  end
end
