class AddDragonflyImagesToSources < ActiveRecord::Migration[4.2]
  def change
    add_column :sources, :image_uid, :string
  end
end
