class AddGramsPerMlToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :grams_per_ml, :float
  end
end
