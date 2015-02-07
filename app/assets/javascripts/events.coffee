$(document).ready ->
  $(document).on 'mouseover', '[title]', (event) ->
    $(this).qtip
      overwrite: false
      position:
        my: 'bottom center'
        at: 'top center'
      style:
        classes: 'qtip-tipsy qtip-shadow'
      show:
        event: event.type
        ready: true
      hide:
        event: 'click mouseleave'
    , event


  $(document).on 'click', '.single-recipe-ingredients li', ->
    $(this).toggleClass('active')

  $(document).on 'click', '.carousel-posts-nav-prev', ->
    $(this).parents('.grid-container').find('.carousel-posts, .home-carousel-posts').trigger('owl.prev')
  $(document).on 'click', '.carousel-posts-nav-next', ->
    $(this).parents('.grid-container').find('.carousel-posts, .home-carousel-posts').trigger('owl.next')
