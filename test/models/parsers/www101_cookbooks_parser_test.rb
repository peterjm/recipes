require 'test_helper'

class Parsers::WWW101CookbooksParserTest < ActiveSupport::TestCase

  def html(fixture)
    read_fixture("html/www101cookbooks/#{fixture}.html")
  end

  def parser(fixture)
    Parsers::WWW101CookbooksParser.new("http://www.101cookbooks.com/archive/foo.html", html(fixture))
  end

  def salad_parser
    @salad_parser ||= parser("lacinato-kale-and-pecorino-salad-recipe")
  end

  def cookie_parser
    @cookie_parser ||= parser("rosewater-shortbread-recipe")
  end

  def shandy_parser
    @shandy_parser ||= parser("winter-shandy-punch-recipe")
  end

  test "#title returns the title" do
    assert_equal "Lacinato Kale and Pecorino Salad", salad_parser.title
    assert_equal "Rosewater Shortbread", cookie_parser.title
    assert_equal "Winter Shandy Punch", shandy_parser.title
  end

  test "#notes returns the notes" do
    assert_equal SALAD_NOTES, salad_parser.notes
    assert_equal COOKIE_NOTES, cookie_parser.notes
    assert_nil shandy_parser.notes
  end

  test "#ingredients returns the ingredients text" do
    assert_equal SALAD_INGREDIENTS, salad_parser.ingredients
    assert_equal COOKIE_INGREDIENTS, cookie_parser.ingredients
    assert_equal SHANDY_INGREDIENTS, shandy_parser.ingredients
  end

  test "#instructions returns the instructions text" do
    assert_equal SALAD_INSTRUCTIONS, salad_parser.instructions
    assert_equal COOKIE_INSTRUCTIONS, cookie_parser.instructions
    assert_equal SHANDY_INSTRUCTIONS, shandy_parser.instructions
  end

  test "#image_urls returns the recipe's image URLs" do
    assert_equal SALAD_IMAGES, salad_parser.image_urls
    assert_equal COOKIE_IMAGES, cookie_parser.image_urls
    assert_equal SHANDY_IMAGES, shandy_parser.image_urls
  end

  test "#image_url returns the first image url" do
    assert_equal SALAD_IMAGES.first, salad_parser.image_url
    assert_equal COOKIE_IMAGES.first, cookie_parser.image_url
    assert_equal SHANDY_IMAGES.first, shandy_parser.image_url
  end

  SALAD_IMAGES = [
    "http://www.101cookbooks.com/mt-static/images/food/lacinato_kale_pecorino_salad.jpg",
    "http://www.101cookbooks.com/mt-static/images/food/lacinato_kale_pecorino_salad_2.jpg",
    "http://www.101cookbooks.com/mt-static/images/food/lacinato_kale_pecorino_salad_3.jpg"
  ]

  COOKIE_IMAGES = [
    "http://www.101cookbooks.com/mt-static/images/food/rosewater_shortbread_recipe.jpg",
    "http://www.101cookbooks.com/mt-static/images/food/rosewater_shortbread_recipe_2.jpg",
    "http://www.101cookbooks.com/mt-static/images/food/rosewater_shortbread_recipe_3.jpg",
    "http://www.101cookbooks.com/mt-static/images/food/rosewater_shortbread_recipe_4.jpg",
    "http://www.101cookbooks.com/mt-static/images/food/rosewater_shortbread_recipe_5.jpg"
  ]

  SHANDY_IMAGES = [
    "http://www.101cookbooks.com/mt-static/images/food/winter_shandy_punch_recipe.jpg",
    "http://www.101cookbooks.com/mt-static/images/food/winter_shandy_punch_recipe_2.jpg",
    "http://www.101cookbooks.com/mt-static/images/food/winter_shandy_punch_recipe_3.jpg"
  ]

  SALAD_NOTES = <<-END.strip_heredoc.strip
    For the intended results, a few notes. I love pebbly-leafed, dark lacinato kale here. Shred it very finely and there is no need to de-stem each leaf (see photo). Also, you can toss the salad ahead of time, and pack it for lunch. On the olive front, Castelvetrano olives are my preference, but any meaty, good tasting green olives will do. Serve over quinoa, or other grain for a nice, substantial meal.
  END

  SALAD_INGREDIENTS = <<-END.strip_heredoc.strip
    1 finely chopped shallot
    scant 1/4 cup freshly squeezed lemon juice
    1/3 cup extra virgin olive oil
    2 teaspoons tahini
    honey and salt to taste

    1 bunch of lacinato kale, finely shredded
    12 brussels sprouts, finely shredded
    3 green onions, trimmed and finely sliced

    1 cup toasted pecans, sliced
    20 large green olives, pitted and sliced
    2/3 cup shredded pecorino cheese

    to serve: any herb flowers you might have (in this case I used coriander blossoms), optional, of course
  END

  SALAD_INSTRUCTIONS = <<-END.strip_heredoc.strip
    Start by making the dressing. In a small bowl, combine the shallot with the lemon juice. Allow to sit for 5-10 minutes before whisking in the olive oil, tahini, honey, and salt.

    Toss the kale, sprouts, and green onions with the dressing. Really mix it well, preferably with your hands, and then allow it to rest for ten minutes. Taste and add more salt if needed. Add the pecans, olives, and pecorino, and gently toss once more before serving topped with chopped herbs and/or herb blossoms.

    Serves 4-6.
  END

  COOKIE_NOTES = <<-END.strip_heredoc.strip
    As far as dried rose petals go, I typically dry my own from unsprayed roses I buy at the farmers market. I've seen them available in Mexican grocers, and also if you search around online you can find them. Also, they're a very pretty component to these cookies, but if you had to leave them out, and rely on the rose water only, they'd still be delicious.
  END

  COOKIE_INGREDIENTS = <<-END.strip_heredoc.strip
    1 cup / 4.5 oz / 130 g unbleached all-purpose flour
    Scant 1 cup / 4.5 oz / 130g whole wheat pastry flour
    1/3 cup / 1 oz / 30 g lightly toasted, sliced, pecans
    1 tablespoon dried rose petals, plus more for sprinkling
    1 tablespoon black sesame seeds, plus more for sprinkling

    1/2 pound (2 sticks) unsalted butter, softened
    1/2 cup / 3.5 oz / 100 g sugar
    scant 1/2 teaspoon fine sea salt
    2 teaspoons rose water
    large grain sugar, for sprinkling
  END

  COOKIE_INSTRUCTIONS = <<-END.strip_heredoc.strip
    In a medium bowl whisk together the all-purpose and whole wheat flours, pecans, rose petals, and sesame seeds. Set aside.

    In a separate medium bowl, or in the bowl of an electric mixer, beat the butter with the sugar, salt and rosewater, until smooth and creamy, about a minute. Add the flour mixture and mix until barely combined. Scrape the dough into a ball, and if you feel like it needs to come together a bit more, knead it once or twice on the counter top, or until it is smooth. Shape into a round, flat patty shape wrap tightly in plastic, and refrigerate for a couple hours, or overnight.

    About fifteen minutes before you're ready to stamp out your cookie shapes, remove the dough from the refrigerator. Position racks in the top and bottom thirds of the oven and preheat to 350F / 180C. Line baking sheets with parchment paper.

    Roll the dough out 1/4-inch thick on a lightly floured counter top, and stamp into desired shapes. You can collect and roll out dough scraps as well, after your first round of stamping. If the dough gets too warm, put it back in the refrigerator for a bit. Place the cookies at least an inch apart on a prepared baking sheets, sprinkle each cookie with a combination of large-grain sugar, rose petals and sesame seeds, then chill them one last time in the freezer for another ten minutes.

    Bake until the cookies are golden at the edges, 13 to 15 minutes, but watch them closely. It's more about coloring than time here. Rotate the sheets back to front about 9 minutes in. Remove from the oven and after a minute or two transfer to a baking rack to cool completely.

    Store leftovers in a big jar, they keep beautifully for days. The recipe makes dozens of tiny cookies, the yield really depends on the size of your cookie cutter.
  END

  SHANDY_INGREDIENTS = <<-END.strip_heredoc.strip
    1 cup freshly squeezed lemon juice
    2/3 cup maple syrup
    3/4 cup (apple) brandy
    1 cup (strong) ginger beer
    ~4 12-ounce pilsner beers
    sliced lemon
  END

  SHANDY_INSTRUCTIONS = <<-END.strip_heredoc.strip
    Strain the lemon juice into a small saucepan, stir in the maple syrup, and bring just to a simmer over medium-low heat. Once the syrup is well incorporated into the lemon juice remove from heat, transfer to a medium bowl, and chill.

    To assemble the punch, add the brandy and well-chilled ginger beer to the lemon-maple mixture. Stir well, then transfer to a punch bowl. If you have an ice block, place this (or equivalent ice cubes) in the bowl as well, along with some thinly sliced lemon. Now add the beer to taste - 4 bottles of pilsner seems about right, but you might go a bit more or less depending on how strong or sweet you like your punch.

    Makes one bowl of punch.
  END
end
