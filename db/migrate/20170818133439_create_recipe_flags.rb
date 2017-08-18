class CreateRecipeFlags < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_flags do |t|
      t.integer :recipe_id, null: false
      t.index :recipe_id, unique: true
    end
  end
end
