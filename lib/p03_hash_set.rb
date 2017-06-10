require_relative 'p02_hashing'

class HashSet
  attr_accessor :count

  def initialize(num_buckets = 8)
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
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
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
