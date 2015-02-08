class AddDragonflyImagesToRecipeImages < ActiveRecord::Migration
  def change
    add_column :recipe_images, :image_uid, :string
  end
end
