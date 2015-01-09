$('#FileUpload').click (e) ->
  e.preventDefault()
  $('#FileChooser').click()

$('#FileChooser').change (e) ->
  $('.image-uploader .images .image.filechooser').remove()
  $.each e.target.files, (index, file) ->
    url = URL.createObjectURL(file)
    image = $('<div>')
      .addClass('image')
      .addClass('filechooser')
      .attr('style', "background-image:url(#{url});background-size:cover")
    $('.image-uploader .images').append(image)
