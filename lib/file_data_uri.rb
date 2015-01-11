class FileDataUri

  def self.from(filename)
    new.from(filename)
  end

  def from(filename)
    content_type = content_type(filename)
    content = File.open(filename) { |f| f.read }
    encoded = Base64.encode64(content)
    "data:#{content_type};base64,#{encoded.chop}"
  end

  def read
    uri.open { |io| io.read }
  end

  def content_type(filename)
    type = `file -Ib #{filename}`.gsub(/\n/,"")
    type.split(';').first
  end

end
