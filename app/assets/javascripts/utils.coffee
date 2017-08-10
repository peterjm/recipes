class Recipes.Utils
  contains: (str, substr) ->
    str.toLowerCase().search(substr.toLowerCase()) >= 0

  toggleClass: (elem, className) ->
    $(elem).toggleClass(className)
