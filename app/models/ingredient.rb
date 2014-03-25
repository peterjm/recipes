class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients, inverse_of: :ingredient
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true, uniqueness: true

  def self.from(name)
    attrs = {name: name}
    find_by(attrs) || new(attrs)
  end

  def to_param
    "#{id}-#{name_was.parameterize}"
  end
end
