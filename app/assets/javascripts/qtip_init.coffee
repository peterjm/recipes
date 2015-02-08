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
