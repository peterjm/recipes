# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe_ingredient do
    text "1 tomato, sliced"
    recipe
    ingredient
    quantity 1
    unit "units"
  end
end
