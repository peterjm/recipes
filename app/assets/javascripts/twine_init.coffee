context = {}

reset = (nodes) ->
  if nodes
    Twine.bind(node) for node in nodes
  else
    Twine.reset(context).bind()

  Twine.refreshImmediately()
  return

document.addEventListener 'DOMContentLoaded', -> reset()

document.addEventListener 'page:load', (event) ->
  reset(event.data)
  return

document.addEventListener 'page:before-partial-replace', (event) ->
  nodes = event.data
  Twine.unbind(node) for node in nodes
  return

$(document).ajaxComplete ->
  Twine.refresh()
