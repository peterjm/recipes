class AddImageToRecipes < ActiveRecord::Migration[4.2]
  def change
    add_column :recipes, :image, :string
  end
end
