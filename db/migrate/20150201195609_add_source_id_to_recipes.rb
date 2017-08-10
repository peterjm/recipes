class AddSourceIdToRecipes < ActiveRecord::Migration[4.2]
  def change
    add_column :recipes, :source_id, :integer
    add_foreign_key :recipes, :sources
  end
end
