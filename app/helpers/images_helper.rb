module ImagesHelper

  def recipe_image_url(image, size=:large)
    if image.new_record?
      image.remote_image_url
    else
      image.url(size)
    end
  end

  def bg_image(url)
    "background-image:url(#{url});background-size:cover"
  end

end
