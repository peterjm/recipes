namespace :dropbox do
  task :auth => :environment do
    oauth = DropboxOAuth2FlowNoRedirect.new(
      Rails.application.secrets.dropbox_app_key,
      Rails.application.secrets.dropbox_app_secret
    )

    url = oauth.start
    puts "Please visit #{url} to authorize the app"
    print "Enter the provided code: "
    code = $stdin.gets.strip
    token, user_id = oauth.finish(code)
    puts "Your auth token is #{token}"
    puts "Your user id is #{user_id}"
  end
end
