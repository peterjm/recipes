class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "#{model.class.to_s.underscore}/#{model.id}"
  end
end
