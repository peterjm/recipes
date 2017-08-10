class CreateSources < ActiveRecord::Migration[4.2]
  def change
    create_table :sources do |t|
      t.string :type, null: false
      t.string :name, null: false
      t.string :author
      t.string :url
    end
  end
end
