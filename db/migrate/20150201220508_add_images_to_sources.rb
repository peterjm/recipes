class AddImagesToSources < ActiveRecord::Migration[4.2]
  def change
    add_column :sources, :image, :string
  end
end
