smk_theme_keyword_index_filter = (elem) ->
  value = $(elem).val().toLowerCase()
  headings = $('.keywords-index-list h4')

  # Hide or show headings
  if value.length > 0 then headings.hide() else headings.show()

  # Hide or show keywords
  $(".keywords-index-list li").each ->
    if $(this).text().toLowerCase().search(value) > -1
      $(this).removeClass('hide-keyword')
    else
      $(this).addClass('hide-keyword')

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

  $(document).on 'keyup', '.keywords-filter-block .filter-keywords', ->
    smk_theme_keyword_index_filter(this)

  $(document).on 'click', '.keywords-filter-block .filter-controls .control', ->
    $(this).parent().children('.control').removeClass('active')
    $(this).addClass('active')
    if $(this).hasClass('block')
      $('.keywords-index-list').addClass('display-block')
    else
      $('.keywords-index-list').removeClass('display-block')

  $(document).on 'mouseenter', '.recipe .recipe-info-pointer', ->
    $(this).next().addClass('active')
    $(this).prev().addClass('inactive')
  $(document).on 'mouseleave', '.recipe .recipe-info-pointer', ->
    $(this).prev().removeClass('inactive')
    $(this).next().removeClass('active')

  $(document).on 'click', '.single-recipe-ingredients li', ->
    $(this).toggleClass('active')

  $(document).on 'click', '.carousel-posts-nav-prev', ->
    $(this).parents('.grid-container').find('.carousel-posts, .home-carousel-posts').trigger('owl.prev')
  $(document).on 'click', '.carousel-posts-nav-next', ->
    $(this).parents('.grid-container').find('.carousel-posts, .home-carousel-posts').trigger('owl.next')
