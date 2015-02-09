module Striplines
  def striplines
    gsub(/^[ \t\u2028]+/, '').gsub(/[ \t\u2028]+$/, '').strip
  end
end

String.send :include, Striplines
