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
    newArray = []
    current = @root
    while current != nil
      newArray.push(current.value)
      current = current.next
    end
    return newArray
  end

end

list = LinkedList.new
