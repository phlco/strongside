require_relative "node"

class LinkedList

  attr_reader :root

  def initialize
    @root = nil
  end

  def unshift(value)
    new_node = Node.new(value)
    new_node.next = @root
    @root = new_node
  end

  def to_a
    array = []
    self.each { |elem| array << elem }
    array
  end

  def each
    cur_node = @root
    while cur_node != nil
      yield(cur_node.value)
      cur_node = cur_node.next
    end
    true
  end

end
