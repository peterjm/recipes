class Recipes.InplaceEditor
  constructor: (node, display, form='form') ->
    @node = node
    @$display = $(@node.querySelector(display))
    @$form = $(@node.querySelector(form))
    @matchHeight()
    @$form.addClass('hide')

  toggle: ->
    @$display.toggleClass('hide')
    @$form.toggleClass('hide')

  matchHeight: ->
    $textarea = @$form.find('textarea')

    dh = @$display.height()
    fh = @$form.height()
    th = $textarea.height()

    fh_without_textarea = fh - th
    new_th = dh - fh_without_textarea

    $textarea.height(new_th)
