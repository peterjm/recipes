class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe, presence: true
  validates :ingredient, presence: true
  validates :text, presence: true
end
