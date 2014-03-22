class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe, presence: true
  validates :ingredient, presence: true
  validates :text, presence: true
  validates :quantity, presence: true, numericality: {greater_than: 0}
  validates :unit, presence: true, inclusion: EyeOfNewt::Unit.all

  before_create :save_ingredient

  delegate :name, to: :ingredient

  def self.build_from(text)
    ing = EyeOfNewt.parse(text)
    new(
      text: text,
      quantity: ing.quantity,
      unit: ing.unit.to_s,
      style: ing.style,
      ingredient: Ingredient.from(ing.name)
    )
  end

  private

  def save_ingredient
    ingredient.save if ingredient.new_record?
  end
end
