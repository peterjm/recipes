require 'dragonfly'
require 'dragonfly/dropbox_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret Rails.application.secrets.dragonfly_secret

  url_format "/media/:job/:name"

  fetch_file_whitelist [
    # List of allowed file paths when using fetch_file (strings or regexps)
    /public/
  ]

  datastore :dropbox,
    app_key:              Rails.application.secrets.dropbox_app_key,
    app_secret:           Rails.application.secrets.dropbox_app_secret,
    access_token:         Rails.application.secrets.dropbox_access_token,
    access_token_secret:  Rails.application.secrets.dropbox_access_token_secret,
    user_id:              Rails.application.secrets.dropbox_user_id

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
