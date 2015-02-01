class Source < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipes, inverse_of: :source

  class Uploader < ::Uploader
    version(:mini)     { process :resize_to_fill => [ 50,  50] }
    version(:thumb)    { process :resize_to_fill => [ 80,  80] }
    version(:small)    { process :resize_to_fill => [240, 220] }
  end
  mount_uploader :image, Uploader

  delegate :url, to: :image

  def to_param
    "#{id}-#{name_was.parameterize}"
  end

  def image_data_uri=(value)
    self.image = DataUriUploadedFile.new(data_uri: value)
  end
end
