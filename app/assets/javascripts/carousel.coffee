class Recipes.Carousel
  constructor: (node, selector, count) ->
    carousel_node = node.querySelector(selector)
    @$node = $(carousel_node)
    @$node.owlCarousel
      items: count
      paginationSpeed: 300
      rewindSpeed: 400

  next: ->
    @$node.trigger('owl.next')

  prev: ->
    @$node.trigger('owl.prev')
