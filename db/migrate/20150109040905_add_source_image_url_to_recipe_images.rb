class AddSourceImageUrlToRecipeImages < ActiveRecord::Migration
  def change
    add_column :recipe_images, :source_image_url, :string
  end
end
