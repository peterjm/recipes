# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless Source.find_by(name: "101 Cookbooks")
  Source.create(
    name: "101 Cookbooks",
    author: "Heidi Swanson",
    url: "http://www.101cookbooks.com",
    source_type: Source::WEBSITE_TYPE
  )
end
