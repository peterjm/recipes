module Enumerable
  def map_ary(*keys)
    map{|elem| keys.map{|k| elem.public_send(k)}}
  end
end
