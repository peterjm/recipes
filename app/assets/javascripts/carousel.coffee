class Recipes.Carousel
  constructor: (node, count) ->
    carousel_node = node.querySelector('.carousel-posts, .home-carousel-posts')
    @$node = $(carousel_node)
    @$node.owlCarousel
      items: count
      paginationSpeed: 300
      rewindSpeed: 400

  next: ->
    @$node.trigger('owl.next')

  prev: ->
    @$node.trigger('owl.prev')
