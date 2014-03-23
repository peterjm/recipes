class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients, inverse_of: :recipe do
    def build_from(*args)
      scoping { klass.build_from(*args) }.tap do |o|
        push(o)
      end
    end

    def with_text(text)
      detect{|ri| ri.text == text}
    end
  end
  has_many :ingredients, through: :recipe_ingredients

  validates :title, presence: true

  def update_recipe_ingredients
    list = IngredientListParser.new(ingredients_text).list
    unused_texts = recipe_ingredients.map(&:text) - list
    list.each do |text|
      recipe_ingredients.with_text(text) || recipe_ingredients.build_from(text)
    end
    recipe_ingredients.destroy unused_texts.map{|t| recipe_ingredients.with_text(t)}
  end
end
