class CreateRecipeImages < ActiveRecord::Migration
  def change
    create_table :recipe_images do |t|
      t.integer :recipe_id, null: false, index: true
      t.string :image, null: false

      t.timestamps
    end
    add_foreign_key :recipe_images, :recipes
    remove_column :recipes, :image, :string
    add_column :recipes, :recipe_image_id, :integer
    add_foreign_key :recipes, :recipe_images
  end
end
