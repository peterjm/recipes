class RemoveOldImageColumns < ActiveRecord::Migration
  def change
    remove_column :recipe_images, :image, :string
    remove_column :sources, :image, :string
  end
end
