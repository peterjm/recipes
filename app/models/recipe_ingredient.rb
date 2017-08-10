class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe, presence: true
  validates :ingredient, presence: true, uniqueness: {scope: :recipe_id}

  before_create :save_ingredient

  def self.build_from(ingredient_name)
    new(
      name: ingredient_name,
      ingredient: Ingredient.from(ingredient_name)
    )
  end

  private

  def save_ingredient
    ingredient.save if ingredient.new_record?
  end
end
