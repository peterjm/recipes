# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :ingredient do
    name { "tomatoes" }
    staple { false }
  end
end
