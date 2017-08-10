class IngredientName < ApplicationRecord
  belongs_to :ingredient, inverse_of: :ingredient_names

  validates :name, presence: true, uniqueness: true

  def self.by(name)
    where(name: name).first
  end

  def self.find_ingredient(name)
    by(name).try(:ingredient)
  end
end
