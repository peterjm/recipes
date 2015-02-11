class RecipeImagePresenter < Presenter
  include HasImage

  alias_method :recipe_image, :element

  def self.model_name
    RecipeImage.model_name
  end

  def dragonfly_image
    recipe_image.image
  end
end
