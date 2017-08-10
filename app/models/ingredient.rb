class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, inverse_of: :ingredient, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients
  has_many :ingredient_names, inverse_of: :ingredient, dependent: :destroy, autosave: true

  validates :name, presence: true, uniqueness: true

  include PerformsActionOnSave
  action_on_save :ensure_ingredient_name

  def ensure_ingredient_name
    ingredient_names.by(name) || ingredient_names.create!(name: name)
  end

  def names
    ingredient_names.map(&:name)
  end

  def alternate_names
    names - [name]
  end

  def self.from(name)
    IngredientName.find_ingredient(name) || new(name: name, ensure_ingredient_name_on_save: true)
  end

  def to_param
    "#{id}-#{name_was.parameterize}"
  end
end
