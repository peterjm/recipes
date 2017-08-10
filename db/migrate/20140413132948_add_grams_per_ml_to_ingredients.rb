class AddGramsPerMlToIngredients < ActiveRecord::Migration[4.2]
  def change
    add_column :ingredients, :grams_per_ml, :float
  end
end
