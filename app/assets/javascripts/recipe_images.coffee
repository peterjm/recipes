$('#FileUpload').click (e) ->
  e.preventDefault()
  $('#FileChooser').click()

stop = (e) ->
  e.stopPropagation()
  e.preventDefault()

drop = (e) ->
  stop(e)
  addFiles(e.dataTransfer.files)

imageDrop = document.getElementById("ImageDrop")
imageDrop.addEventListener("dragenter", stop, false)
imageDrop.addEventListener("dragover", stop, false)
imageDrop.addEventListener("drop", drop, false)

$('#FileChooser').change (e) ->
  addFiles(e.target.files)

addFiles = (files) ->
  $('.image-uploader .images .image.filechooser').remove()
  $.each files, (index, file) -> addFile(file)

addFile = (file) ->
  url = URL.createObjectURL(file)
  image = $('<div>')
    .addClass('image')
    .addClass('filechooser')
    .attr('style', "background-image:url(#{url});background-size:cover")
  $('.image-uploader .images').append(image)
