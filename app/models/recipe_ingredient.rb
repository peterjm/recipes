class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe, presence: true
  validates :ingredient, presence: true
  validates :text, presence: true
  validates :quantity, presence: true, numericality: {greater_than: 0}
  validates :unit, presence: true, inclusion: EyeOfNewt::Unit.all
end
