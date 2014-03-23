class Recipe < ActiveRecord::Base
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients, ->{ extending(RecipeIngredientExtension).order('position ASC') }, inverse_of: :recipe, autosave: true

  validates :title, presence: true

  def update_recipe_ingredients
    list = IngredientListParser.new(ingredients_text).list
    recipe_ingredients.update_from(list)
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
      current_texts = map(&:text)

      new_texts = list - current_texts
      new_texts.each { |t| build_from(t) }

      unused_texts = current_texts - list
      destroy unused_texts.map{ |t| matching(t) }
    end
  end
end
