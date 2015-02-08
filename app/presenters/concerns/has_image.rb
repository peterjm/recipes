module HasImage
  extend ActiveSupport::Concern

  def dragonfly_image
    element.image
  end

  def image(size=nil)
    size = translate_size(size)
    if size.present?
      dragonfly_image.thumb(size).url
    else
      dragonfly_image.url
    end
  end

  def translate_size(size)
    case size.to_s
    when "mini" then "50x50#"
    when "thumb" then "80x80#"
    when "small" then "240x220#"
    when "medium" then "350x240#"
    when "large" then "560x380#"
    when "full" then "780x520#"
    else size
    end
  end
end
