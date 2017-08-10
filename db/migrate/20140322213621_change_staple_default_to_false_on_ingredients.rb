class ChangeStapleDefaultToFalseOnIngredients < ActiveRecord::Migration[4.2]
  def change
    change_column :ingredients, :staple, :boolean, default: false, null: false
  end
end
