require_relative "node"

class LinkedList

  attr_reader :root

  def initialize
    @root = nil
  end

  # add node to beginning of list
  def unshift(value)
    new_node = Node.new(value)
    new_node.next = @root
    @root = new_node
    self.to_a
  end

  # remove first node
  def shift
    unless @root.nil?
      shifter = @root
      @root = @root.next
      shifter.value
    end
  end

  # add node to end of list
  def push(value)
    unless root.nil?
      current_node = @root
      while !current_node.next.nil?
        current_node = current_node.next
      end
      current_node.next = Node.new(value)
      self.to_a
    end
  end

  # remove node off end
  def pop
    unless @root.nil?
      current_node = @root
      while !current_node.next.next.nil?
        current_node = current_node.next
      end
      popped = current_node.next.value
      current_node.next = nil
      popped
    end
  end

  # retrieve node from list
  def fetch(value)
    index = 0
    current_node = @root
    while !current_node.nil?
      if current_node.value == value
        return index
      else
        index += 1
      end
      current_node = current_node.next
    end
  end

  # add node to middle of list
  def insert(value, index)
    i = 0
    current_node = @root
    while !current_node.nil?
      if i == index
        current_node = Node.new(value)

      else
        i += 1
      end
      current_node = current_node.next
    end
  end

  # delete node from list
  def delete(index)

  end

  def to_a
    current_node = @root
    array = []
    while !current_node.nil?
      array << current_node.value
      current_node = current_node.next
    end
    array
  end

end

      # @ll = LinkedList.new
      # @ll.unshift("C")
      # @ll.unshift("B")
      # @ll.unshift("A")
      # @ll.delete(0)
      # binding.pry