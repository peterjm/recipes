class AddDragonflyImagesToSources < ActiveRecord::Migration
  def change
    add_column :sources, :image_uid, :string
  end
end
