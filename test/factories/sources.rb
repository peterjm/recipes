# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :source do
    source_type Source::OTHER_TYPE
    name "My Food Blog"

    factory :website_source do
      source_type Source::WEBSITE_TYPE
      url "http://myfoodblog.com"
    end
  end
end
