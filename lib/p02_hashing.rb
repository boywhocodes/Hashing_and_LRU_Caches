class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 10 if self.empty?
    x = self.map.with_index{|y, idx| y.hash + idx}
    x.reduce(&:^)
  end
end

class String
  def hash
    km_arr = self.split("")
    km_arr.map! { |x| x.ord }
    km_arr.hash
  end
end
#
class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    x = 123456789
    self.each do |kwon,vilbert|
      x ^= kwon.hash ^ vilbert.hash
    end
    x
  end
end
