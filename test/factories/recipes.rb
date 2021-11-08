# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :recipe do
    title { "Pizza" }
    ingredients_text do
      <<-ING.strip_heredoc
        1 cup flour
        yeast
        pizza sauce
        mushrooms
      ING
    end
    instructions_text do
      <<-INS.strip_heredoc
        1. Make the dough
        2. add the toppings
        3. Bake it!
      INS
    end
    basic_source { "The Pizza Book, page 10" }
  end
end
