require 'test_helper'

class RecipeImageTest < ActiveSupport::TestCase

  def data_uri
    data_uri_from_fixture("test_image.jpg")
  end

  test "#image_data_uri saves an image from a data URI" do
    recipe = create(:recipe)
    img = recipe.images.build(image_data_uri: data_uri)
    assert img.valid?
  end
end
