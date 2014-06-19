class LinkedList

  attr_reader :root

  def initialize
    @root = nil
  end

  def unshift(value)
    new_node = Node.new(value)

    @root = new_node
    new_node.nxt = nil
    # See if you can fill in unshift
  end

end
