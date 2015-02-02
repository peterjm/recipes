class Recipes.ImageChooser
  ACCEPTED_TYPES: ['image/png', 'image/jpeg']

  constructor: (options={}) ->
    {@maxImages} = options

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
    input.value = url
    input.disabled = false

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
    if file.type in @ACCEPTED_TYPES
      @readDataUrl file, (fileUri) =>
        numImages = @numImages()
        image = @newImage(fileUri, numImages)
        excessImages = numImages - @maxImages if @maxImages
        for elem, index in @imageList.querySelectorAll('.image')
          elem.remove() if excessImages && index < excessImages
        @imageList.appendChild(image)

        @fileChooser.value = ''

  readDataUrl: (file, callback) ->
    reader = new FileReader()
    reader.onload = (evt) =>
      fileUri = evt.target.result
      callback(fileUri)

    reader.readAsDataURL(file)

  removeOnClick: (image) ->
    image.querySelector('.remove').addEventListener "click", (e) =>
      e.preventDefault()
      image.querySelector('input.image_data_uri')?.remove()
      image.querySelector('input.remove_image')?.value = '1'
      image.style['display'] = 'none'
