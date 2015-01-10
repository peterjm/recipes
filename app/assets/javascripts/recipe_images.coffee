fileUpload = document.getElementById('FileUpload')
fileChooser = document.getElementById('FileChooser')
imageDrop = document.getElementById('ImageDrop')
imageList = document.getElementById('ImageList')
imageTemplate = document.getElementById('ImageTemplate')

newImage = (url, number) ->
  image = imageTemplate.cloneNode(true)

  input = image.querySelector('input')
  name = input.getAttribute('name')
  input.setAttribute('name', name.replace("NUM", number))

  image.removeAttribute('id')
  image.style['display'] = null
  image.style['background-image'] = "url(#{url})"

  image

stop = (e) ->
  e.stopPropagation()
  e.preventDefault()

numImages = ->
  document.querySelectorAll('.image-uploader .images .image').length

handleFiles = (files) ->
  elem.remove() for elem in document.querySelectorAll('.image-uploader .images .image.filechooser')
  handleFile(file) for file, index in files

handleFile = (file) ->
  url = URL.createObjectURL(file)
  image = newImage(url, numImages())
  imageList.appendChild(image)

fileUpload.addEventListener "click", (e) ->
  e.preventDefault()
  fileChooser.click()

fileChooser.addEventListener "change", (e) ->
  handleFiles(e.target.files)

imageDrop.addEventListener "dragenter", stop
imageDrop.addEventListener "dragover", stop
imageDrop.addEventListener "drop", (e) ->
  stop(e)
  handleFiles(e.dataTransfer.files)
