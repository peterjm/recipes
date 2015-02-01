class Recipe < ActiveRecord::Base
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients, ->{ extending(RecipeIngredientExtension) }, inverse_of: :recipe, dependent: :destroy, autosave: true
  has_many :images, class_name: RecipeImage, inverse_of: :recipe, dependent: :destroy, autosave: true
  belongs_to :image, class_name: RecipeImage, foreign_key: :recipe_image_id

  belongs_to :source, inverse_of: :recipes

  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, presence: true

  include PerformsActionOnSave
  action_on_save :update_recipe_ingredients
  action_on_save :update_primary_image

  def ingredient_lines
    IngredientListParser.new(ingredients_text).ingredients
  end

  def update_recipe_ingredients
    names = ingredient_lines.select(&:parsed?).map(&:name)
    recipe_ingredients.update_from(names)
  end

  def update_primary_image
    if (image_id = images.first.try(:id)) != recipe_image_id
      update_attribute :recipe_image_id, image_id
    end
  end

  def to_param
    "#{id}-#{title_was.parameterize}"
  end

  module RecipeIngredientExtension
    def build_from(*args)
      scoping { klass.build_from(*args) }.tap do |o|
        push(o)
      end
    end

    def update_from(ingredient_names)
      add_new(ingredient_names)
      remove_old(ingredient_names)
    end

    def named(ingredient_name)
      detect{|ri| ri.name == ingredient_name}
    end

    private

    def current_list
      map(&:name)
    end

    def add_new(list)
      new_names = list - current_list
      new_names.each { |name| build_from(name) }
    end

    def remove_old(list)
      unused_names = current_list - list
      destroy unused_names.map{ |name| matching(name) }
    end

    def matching(name)
      detect{|ri| ri.name == name}
    end
  end
end
