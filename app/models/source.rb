class Source < ApplicationRecord
  TYPES = [
    WEBSITE_TYPE = "website",
    BOOK_TYPE = "book",
    OTHER_TYPE = "other",
  ]

  validates :name, :source_type, presence: true
  validates :source_type, presence: true, inclusion: TYPES
  validates :url, presence: true, if: :website?

  has_many :recipes, inverse_of: :source

  dragonfly_accessor :image do
    default 'public/images/defaults/source.jpg'
  end

  def website?
    source_type == WEBSITE_TYPE
  end

  def to_param
    "#{id}-#{name_was.parameterize}"
  end

  def image_data_uri=(value)
    self.image = DataUriUploadedFile.new(data_uri: value)
  end
end
