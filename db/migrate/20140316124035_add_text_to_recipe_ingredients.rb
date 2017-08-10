class AddTextToRecipeIngredients < ActiveRecord::Migration[4.2]
  def change
    add_column :recipe_ingredients, :text, :string, null: false, default: ""
  end
end
