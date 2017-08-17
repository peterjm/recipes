require 'dragonfly'
require 'dragonfly/dropbox_data_store'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret Rails.application.secrets.dragonfly_secret

  url_format "/media/:job/:name"

  fetch_file_whitelist [
    # List of allowed file paths when using fetch_file (strings or regexps)
    /public/
  ]

  if Rails.env.production?
    datastore :s3,
      bucket_name: Rails.application.secrets.s3_bucket_name,
      access_key_id: Rails.application.secrets.aws_access_key,
      secret_access_key: Rails.application.secrets.aws_secret
  else
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
      server_root: Rails.root.join('public')
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware
