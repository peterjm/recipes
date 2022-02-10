class RecipeYmlSerializer
  attr_reader :recipe, :host

  def initialize(recipe, host)
    @recipe = recipe
    @host = host
  end

  def to_yaml
    attributes.stringify_keys.to_yaml
  end

  def attributes
    {
      name: recipe.title,
      source: recipe.basic_source || recipe.source.name,
      image: image_url,
      notes: recipe.notes,
      ingredients: recipe.ingredients_text,
      directions: recipe.instructions_text
    }
  end

  private

  def image_url
    return nil unless recipe.has_image?

    URI("https://#{host}#{recipe.image}").to_s
  end
end
