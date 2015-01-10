class Recipes.Images
  constructor: ->
    @imageUploader = document.getElementById('ImageUploader')
    @fileUpload = document.getElementById('FileUpload')
    @fileChooser = document.getElementById('FileChooser')
    @imageList = document.getElementById('ImageList')
    @imageTemplate = document.getElementById('ImageTemplate')

    @removeOnClick(image) for image in @imageList.querySelectorAll('.image')

    @fileUpload.addEventListener "click", (e) =>
      e.preventDefault()
      @fileChooser.click()

    @fileChooser.addEventListener "change", (e) =>
      @handleFiles(e.target.files)

    @imageUploader.addEventListener "dragenter", @stop
    @imageUploader.addEventListener "dragover", @stop
    @imageUploader.addEventListener "drop", (e) =>
      @stop(e)
      @handleFiles(e.dataTransfer.files)

  newImage: (url, number) ->
    image = @imageTemplate.cloneNode(true)

    input = image.querySelector('input')
    name = input.getAttribute('name')
    input.setAttribute('name', name.replace("NUM", number))

    image.removeAttribute('id')
    image.style['display'] = null
    image.style['background-image'] = "url(#{url})"

    @removeOnClick(image)

    image

  stop: (e) ->
    e.stopPropagation()
    e.preventDefault()

  numImages: ->
    @imageList.querySelectorAll('.image').length

  handleFiles: (files) ->
    elem.remove() for elem in @imageList.querySelectorAll('.image.filechooser')
    @handleFile(file) for file, index in files

  handleFile: (file) ->
    url = URL.createObjectURL(file)
    image = @newImage(url, @numImages())
    @imageList.appendChild(image)

  removeOnClick: (image) ->
    image.querySelector('.remove').addEventListener "click", (e) ->
      e.preventDefault()
      image.querySelector('input').remove()
      image.style['display'] = 'none'
