class Source < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipes, inverse_of: :source

  def to_param
    "#{id}-#{name_was.parameterize}"
  end
end
