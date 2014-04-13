# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe_ingredient do
    text "2 tomatoes, sliced"
    recipe
    ingredient
  end
end
