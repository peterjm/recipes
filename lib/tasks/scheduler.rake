namespace :scheduler do
  task :ping do
    require 'net/http'

    Net::HTTP.get('recipes.424shaw.ca', '/ping')
  end
end
