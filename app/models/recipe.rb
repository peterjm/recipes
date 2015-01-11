class Recipe < ActiveRecord::Base
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients, ->{ extending(RecipeIngredientExtension).order('position ASC') }, inverse_of: :recipe, dependent: :destroy, autosave: true
  has_many :images, class_name: RecipeImage, inverse_of: :recipe, dependent: :destroy, autosave: true
  belongs_to :image, class_name: RecipeImage, foreign_key: :recipe_image_id

  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, presence: true

  include PerformsActionOnSave
  action_on_save :update_recipe_ingredients
  action_on_save :update_primary_image

  def update_recipe_ingredients
    list = IngredientListParser.new(ingredients_text).list
    recipe_ingredients.update_from(list)
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

    def matching(text)
      detect{|ri| ri.text == text}
    end

    def update_from(list)
      add_new(list)
      remove_old(list)
      reorder_by(list)
    end

    def current_list
      map(&:text)
    end

    private

    def add_new(list)
      new_texts = list - current_list
      new_texts.each { |t| build_from(t) }
    end

    def remove_old(list)
      unused_texts = current_list - list
      destroy unused_texts.map{ |t| matching(t) }
    end

    def reorder_by(list)
      each { |ri| ri.position = list.index(ri.text) + 1 }
      proxy_association.load_target.sort_by!(&:position)
    end
  end
end
