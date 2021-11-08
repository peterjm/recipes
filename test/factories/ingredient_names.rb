# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :ingredient_name do
    name { "tomatoes" }
    association :ingredient, name: "tomatoes"
  end
end
