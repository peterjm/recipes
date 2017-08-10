class AddIndexToSources < ActiveRecord::Migration[4.2]
  def change
    add_index :sources, :name, unique: true
  end
end
