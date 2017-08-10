class AddSourceImageUrlToRecipeImages < ActiveRecord::Migration[4.2]
  def change
    add_column :recipe_images, :source_image_url, :string
  end
end
