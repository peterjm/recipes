class RenameRecipeSourceToBasicSource < ActiveRecord::Migration[4.2]
  def change
    rename_column :recipes, :source, :basic_source
  end
end
