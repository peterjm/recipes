class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients, inverse_of: :ingredient
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true, uniqueness: true
  validate :validate_name_is_pluralized

  def self.from(name)
    attrs = {name: name.pluralize}
    find_by(attrs) || new(attrs)
  end

  def to_param
    "#{id}-#{name_was.parameterize}"
  end

  private

  def validate_name_is_pluralized
    return unless name
    unless name.pluralize == name
      errors.add(:name, "must be pluralized")
    end
  end
end
