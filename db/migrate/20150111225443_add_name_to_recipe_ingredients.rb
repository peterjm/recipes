class AddNameToRecipeIngredients < ActiveRecord::Migration[4.2]
  def change
    add_column :recipe_ingredients, :name, :string, default: "", null: false
  end
end
