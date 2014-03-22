class ChangeStapleDefaultToFalseOnIngredients < ActiveRecord::Migration
  def change
    change_column :ingredients, :staple, :boolean, default: false, null: false
  end
end
