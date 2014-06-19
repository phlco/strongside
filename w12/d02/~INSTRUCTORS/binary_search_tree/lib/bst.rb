#binary search tree
require "pry"
require_relative "node"

class BST

  attr_reader :root

  def initialize
    @root = nil
  end


  # V2
  def add(value)
    if @root.nil?
      @root = new_node

    else
      current_node = @root

      while current_node != nil
        previous_node = current_node
        puts current_node.value

        if new_node.value > current_node.value
          current_node = current_node.right

        elsif new_node.value < current_node.value
          current_node = current_node.left

        else
          return false
        end
      end

      if new_node.value > previous_node.value
        previous_node.right = new_node
      else
        previous_node.left = new_node
      end

    end

  end

  # V1
  def add(value)
    new_node = Node.new(value)


    if @root.nil?
      @root = new_node

    else
      current_node = @root

      while current_node != nil
        previous_node = current_node

        binding.pry


        puts current_node.value

        if new_node.value > current_node.value
          current_node = current_node.right

        elsif new_node.value < current_node.value
          current_node = current_node.left

        else
          return false
        end
      end

      if new_node.value > previous_node.value
        previous_node.right = new_node
      else
      #elsif new_node.value < previous_node.value
        previous_node.left = new_node
      end

    end

  end

end


