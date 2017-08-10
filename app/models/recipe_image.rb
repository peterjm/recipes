class RecipeImage < ApplicationRecord
  belongs_to :recipe, inverse_of: :images, required: true

  validates_presence_of :image

  before_validation :copy_image_url, on: :create

  dragonfly_accessor :image do
    default 'public/images/defaults/recipe.jpg'
  end

  def image_data_uri=(value)
    self.image = DataUriUploadedFile.new(data_uri: value)
  end

  private

  def copy_image_url
    self.image_url = source_image_url if source_image_url
  end

  def copy_source_url
    self.source_image_url = image_url if image_url
  end
end
