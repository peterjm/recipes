class Source < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipes, inverse_of: :source

  dragonfly_accessor :image do
    default 'public/images/defaults/source.jpg'
  end

  def to_param
    "#{id}-#{name_was.parameterize}"
  end

  def image_data_uri=(value)
    self.image = DataUriUploadedFile.new(data_uri: value)
  end
end
