module Striplines
  def striplines
    gsub(/[ \t]*([\r\n]+)[ \t]*/, '\1')
  end
end

String.send :include, Striplines
