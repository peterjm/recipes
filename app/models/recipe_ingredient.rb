class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe, presence: true
  validates :ingredient, presence: true
  validates :text, presence: true

  before_create :save_ingredient

  delegate :name, to: :ingredient

  def self.build_from(text)
    ing = EyeOfNewt.parse(text)
    new(
      text: text,
      ingredient: Ingredient.from(ing.name)
    )
  end

  def unit
    parsed_ingredient.unit.to_s
  end

  def quantity
    parsed_ingredient.quantity
  end

  def style
    parsed_ingredient.style
  end

  def notes
  end

  private

  def parsed_ingredient
    @parsed_ingredient ||= EyeOfNewt.parse(text)
  end

  def save_ingredient
    ingredient.save if ingredient.new_record?
  end
end
