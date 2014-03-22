class Ingredient < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validate :validate_name_is_pluralized

  private

  def validate_name_is_pluralized
    return unless name
    unless name.pluralize == name
      errors.add(:name, "must be pluralized")
    end
  end
end
