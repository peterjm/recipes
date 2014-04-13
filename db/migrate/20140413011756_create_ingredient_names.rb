class CreateIngredientNames < ActiveRecord::Migration
  def change
    create_table :ingredient_names do |t|
      t.integer :ingredient_id, null: false
      t.string :name, null: false, unique: true

      t.timestamps
    end
    add_index :ingredient_names, :ingredient_id
    add_index :ingredient_names, :name
  end
end
