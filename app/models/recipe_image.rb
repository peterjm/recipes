class RecipeImage < ActiveRecord::Base
  belongs_to :recipe, inverse_of: :images, required: true

  validates_presence_of :image

  before_save :copy_source_url, on: :create

  class Uploader < ::Uploader
    version(:mini)     { process :resize_to_fill => [ 50,  50] }
    version(:thumb)    { process :resize_to_fill => [ 80,  80] }
    version(:small)    { process :resize_to_fill => [240, 220] }
    version(:medium)   { process :resize_to_fill => [350, 240] }
    version(:large)    { process :resize_to_fill => [560, 380] }
    version(:full)     { process :resize_to_fill => [780, 520] }
  end
  mount_uploader :image, Uploader

  delegate :url, to: :image

  def image_data_uri=(value)
    self.image = DataUriUploadedFile.new(data_uri: value)
  end

  private

  def copy_source_url
    self.source_image_url = remote_image_url
  end
end
