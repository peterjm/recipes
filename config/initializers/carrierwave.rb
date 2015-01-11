CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/uploads"

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  elsif Rails.env.development?
    config.storage = :file
    config.root = "#{Rails.root}/public"
  else
    config.storage = Dropbox::Storage
  end
end
