class RemoveOldImageColumns < ActiveRecord::Migration[4.2]
  def change
    remove_column :recipe_images, :image, :string
    remove_column :sources, :image, :string
  end
end
