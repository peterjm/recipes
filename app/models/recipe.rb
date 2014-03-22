class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients, inverse_of: :recipe
  has_many :ingredients, through: :recipe_ingredients

  validates :title, presence: true
end
