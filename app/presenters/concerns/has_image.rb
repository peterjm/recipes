module HasImage
  extend ActiveSupport::Concern

  RANDOM_IMAGE_COUNT = 20
  def image(size=nil)
    return element.image unless size

    if element.image
      element.image.url(size)
    else
      default_image(size)
    end
  end

  def default_image(size)
    hex = Digest::SHA1.hexdigest(title).to_i(16)
    number = case size.to_s
    when 'large'
      hex % 2 == 0 ? 8 : 21
    when 'full'
      1
    else
      (hex % RANDOM_IMAGE_COUNT) + 1
    end
    "defaults/food/#{size}/#{number}.jpg"
  end
end
