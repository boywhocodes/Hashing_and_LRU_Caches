class MaxIntSet
  def initialize(max)
     @store = Array.new(max) { false }
  end

  def insert(num)
    raise "Out of bounds" unless num.between?(0,@store.length-1)
    @store[num] = true
  end

  def remove(num)
    raise "Out of bounds" unless num.between?(0,@store.length-1)
    @store[num] = false
  end

  def include?(num)
    raise "Out of bounds" unless num.between?(0,@store.length-1)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end



class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end


  def num_buckets
    @store.length - 1
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    unless self.include?(num)
      if self.count >= num_buckets
        resize!
        zero_nums = @store
        @store = Array.new(num_buckets) { Array.new }
        zero_nums.each do |array|
          array.each do |el|
            self[el] << el
          end
        end
      end
      self[num] << num
      self.count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      self.count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end


  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times do
      @store << []
    end
  end
end
