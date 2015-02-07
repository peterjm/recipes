class Recipes.Utils
  scrollTo: (dest, speed) ->
    event.preventDefault()
    # Animate the jump
    $("html, body").animate
      scrollTop: parseInt( $(dest).offset().top ) - 50
    , speed
