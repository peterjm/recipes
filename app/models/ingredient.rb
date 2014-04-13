class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients, inverse_of: :ingredient
  has_many :recipes, through: :recipe_ingredients
  has_many :ingredient_names, inverse_of: :ingredient, autosave: true

  validates :name, presence: true, uniqueness: true

  include PerformsActionOnSave
  action_on_save :ensure_ingredient_name

  def ensure_ingredient_name
    ingredient_names.by(name) || ingredient_names.create!(name: name)
  end

  def self.from(name)
    attrs = {name: name}
    IngredientName.find_ingredient(name) || new(name: name, ensure_ingredient_name_on_save: true)
  end

  def to_param
    "#{id}-#{name_was.parameterize}"
  end
end
