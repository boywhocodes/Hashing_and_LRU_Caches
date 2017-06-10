require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store.each do |x|
      if x.include?(key)
        return true
      end
    end
    false
  end

  def set(key, val)
    if x.include?(key)
      self[key].update(key, val)
      @count += 1
    end
  end

  def get(key)
    x = @store[key.hash % num_buckets]
    return true if x.include?(key)
    false
  end

  def delete(key)
    x = @store[key.hash % num_buckets]
    x.remove(key)
  end

  def each
    @store.each do |y|
      x = @head.next
      until x == @tail
        yield x
        x = x.next
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets].get(num)
  end



  private

  def num_buckets
    @store.length
  end

  def resize!

  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
