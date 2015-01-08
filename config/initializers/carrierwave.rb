CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/uploads"

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = Dropbox::Storage
  end
end
