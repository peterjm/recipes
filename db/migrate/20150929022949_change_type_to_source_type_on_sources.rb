class ChangeTypeToSourceTypeOnSources < ActiveRecord::Migration[4.2]
  def change
    rename_column :sources, :type, :source_type
  end
end
