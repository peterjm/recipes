class CreateIngredients < ActiveRecord::Migration[4.2]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false, unique: true
      t.boolean :staple, null: false

      t.timestamps
    end
    add_index :ingredients, :name
  end
end
