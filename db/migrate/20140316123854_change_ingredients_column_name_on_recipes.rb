class ChangeIngredientsColumnNameOnRecipes < ActiveRecord::Migration
  def change
    rename_column :recipes, :ingredients, :ingredients_text
    rename_column :recipes, :instructions, :instructions_text
  end
end
