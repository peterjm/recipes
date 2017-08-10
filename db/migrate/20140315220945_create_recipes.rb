class CreateRecipes < ActiveRecord::Migration[4.2]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :ingredients
      t.text :instructions
      t.string :source

      t.timestamps
    end
  end
end
