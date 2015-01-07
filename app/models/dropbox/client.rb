module Dropbox
  class Client < DropboxClient
    def initialize
      super(Rails.application.secrets.dropbox_user_token)
    end
  end
end
