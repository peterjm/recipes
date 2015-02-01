class Source < ActiveResource::Base
  validates :name, presence: true
end
