# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient_name do
    name "tomatoes"
    association :ingredient, name: "tomatoes"
  end
end
