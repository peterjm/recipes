class AddDescriptionToSources < ActiveRecord::Migration[4.2]
  def change
    add_column :sources, :description, :text
  end
end
