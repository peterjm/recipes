class Source < ActiveResource::Base
  validates :name, presence: true

  has_many :recipes, inverse_of: :source
end
