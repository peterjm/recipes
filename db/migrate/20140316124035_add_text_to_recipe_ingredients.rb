class AddTextToRecipeIngredients < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :text, :string, null: false, default: ""
  end
end
