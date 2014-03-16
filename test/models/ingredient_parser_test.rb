require 'test_helper'

class IngredientParserTest < ActiveSupport::TestCase
  BASIC_INGREDIENTS = {
    '1 cup tomatoes, diced' => ["1 cup", "tomatoes", "diced"],
    #'1 1/2 cups all-purpose flour' => ["1 1/2 cups", "all-purpose flour"],
    #'3 1/2 teaspoons baking powder' => ["3 1/2 teaspoons", "baking powder"],
    #'1 teaspoon salt' => ["1 teaspoon", "salt"],
    #'1 tablespoon white sugar' => ["1 tablespoon", "white sugar"],
    #'1 1/4 cups milk' => ["1 1/4 cups", "milk"],
    #'1 egg' => ["1", "egg"],
    #'3 tablespoons butter, melted' => ["3 tablespoons", "butter", "melted"],
    #'2 pounds lean ground beef' => ["2 pounds", "lean ground beef"],
    #'1 (46 fluid ounce) can tomato juice' => ["1 (46 fluid ounce) can", "tomato juice"],
    #'1 (29 ounce) can tomato sauce' => ["1 (29 ounce) can", "tomato sauce"],
    #'1 (15 ounce) can kidney beans, drained and rinsed' => ["1 (29 ounce) can", "kidney beans", "drained and rinsed"],
    #'1 (15 ounce) can pinto beans, drained and rinsed' => ["1 (29 ounce) can", "pinto beans", "drained and rinsed"],
    #'1 1/2 cups chopped onion' => ["1 1/2 cups", "onion", "chopped"],
    #'1/4 cup chopped green bell pepper' => ["1/4 cup", "green bell pepper", "chopped"],
    #'1/8 teaspoon ground cayenne pepper' => ["1/8 teaspoon", "ground cayenne pepper"],
    #'1/2 teaspoon white sugar' => ["1/2 teaspoon", "white sugar"],
    #'1/2 teaspoon dried oregano' => ["1/2 teaspoon", "dried oregano"],
    #'1/2 teaspoon ground black pepper' => ["1/2 teaspoon", "ground black pepper"],
    #'1 teaspoon salt' => ["1/8 teaspoon", "salt"],
    #'1 1/2 teaspoons ground cumin' => ["1 1/2 teaspoons", "ground cumin"],
    #'1/4 cup chili powder' => ["1/4 cup", "chili powder"]
  }

  BASIC_INGREDIENTS.each do |line, (quantity, name, style)|
    test "parses #{line} correctly" do
      parser = IngredientParser.new(line)
      assert_equal quantity, parser.quantity, %Q{incorrect quantity}
      assert_equal name, parser.name, %Q{incorrect name}
      assert_equal style, parser.style, %Q{incorrect style}
    end
  end
end
