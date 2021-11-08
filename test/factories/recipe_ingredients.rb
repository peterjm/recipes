# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :recipe_ingredient do
    recipe
    ingredient
  end
end
