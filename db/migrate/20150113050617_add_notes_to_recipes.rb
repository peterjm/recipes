class AddNotesToRecipes < ActiveRecord::Migration[4.2]
  def change
    add_column :recipes, :notes, :text
  end
end
