# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    title "Pizza"
    ingredients <<-ING.strip_heredoc
      1 cup flour
      yeast
      pizza sauce
      mushrooms
    ING
    instructions <<-INS.strip_heredoc
      1. Make the dough
      2. add the toppings
      3. Bake it!
    INS
    source "The Pizza Book, page 10"
  end
end
