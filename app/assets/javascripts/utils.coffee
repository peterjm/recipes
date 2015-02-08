class Recipes.Utils
  scrollTo: (dest, speed) ->
    event.preventDefault()
    # Animate the jump
    $("html, body").animate
      scrollTop: parseInt( $(dest).offset().top ) - 50
    , speed

  contains: (str, substr) ->
    str.toLowerCase().search(substr.toLowerCase()) >= 0

  toggleClass: (elem, className) ->
    $(elem).toggleClass(className)
