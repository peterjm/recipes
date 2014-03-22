class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients, inverse_of: :ingredient
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true, uniqueness: true
  validate :validate_name_is_pluralized

  private

  def validate_name_is_pluralized
    return unless name
    unless name.pluralize == name
      errors.add(:name, "must be pluralized")
    end
  end
end
