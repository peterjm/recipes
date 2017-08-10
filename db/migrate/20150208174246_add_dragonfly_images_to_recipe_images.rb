class AddDragonflyImagesToRecipeImages < ActiveRecord::Migration[4.2]
  def change
    add_column :recipe_images, :image_uid, :string
  end
end
