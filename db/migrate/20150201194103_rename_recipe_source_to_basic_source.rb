class RenameRecipeSourceToBasicSource < ActiveRecord::Migration
  def change
    rename_column :recipes, :source, :basic_source
  end
end
