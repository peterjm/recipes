class Recipes.ImageChooser
  ACCEPTED_TYPES: ['image/png', 'image/jpeg']

  constructor: (node, options={}) ->
    {@maxImages} = options

    @node = node
    @imageUploader = document.getElementById('ImageUploader')
    @fileUpload = document.getElementById('FileUpload')
    @fileChooser = document.getElementById('FileChooser')
    @visibleContent = document.getElementById('VisibleContent')
    @imageTemplate = document.getElementById('ImageTemplate')

    @removeOnClick(image) for image in @visibleContent.querySelectorAll('[data-image]')

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
    @visibleContent.querySelectorAll('[data-image]').length

  handleFiles: (files) ->
    elem.remove() for elem in @visibleContent.querySelectorAll('[data-recently-uploaded]')
    @handleFile(file) for file, index in files
    @fileChooser.value = ''

  handleFile: (file) ->
    if file.type in @ACCEPTED_TYPES
      @readDataUrl file, (fileUri) =>
        numImages = @numImages()
        unless @maxImages && (numImages >= @maxImages)
          image = @newImage(fileUri, numImages)
          @visibleContent.insertBefore(image, @fileUpload)

  readDataUrl: (file, callback) ->
    reader = new FileReader()
    reader.onload = (evt) =>
      fileUri = evt.target.result
      callback(fileUri)

    reader.readAsDataURL(file)

  removeOnClick: (image) ->
    image.querySelector('.remove').addEventListener "click", (e) =>
      e.preventDefault()
      image.querySelector('input[data-image-data-uri]')?.remove()
      image.querySelector('input[data-remove-image]')?.value = '1'
      image.style['display'] = 'none'
