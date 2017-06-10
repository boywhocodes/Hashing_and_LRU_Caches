class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each{ |el| return el.val if el.key == key }
  end

  def include?(key)
    self.each { |el| return true if el.key == key}
    false
  end

  def append(key, val)
    y = Link.new(key, val)
    x = @tail.prev
    x.next = y
    y.prev = x
    y.next = @tail
    @tail.prev = y
  end

  def update(key, val)
    self.each{ |el| el.val = val if el.key == key }
  end

  def remove(key)
    x = nil
    self.each{ |el| x = el if el.key == key}
    x.prev.next = x.next
    x.next.prev = x.prev 

  end

  def each
    x = @head.next
    until x == @tail
      yield x
      x = x.next
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
