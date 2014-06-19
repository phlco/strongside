require_relative "node"

root = nil

# Unshift

# binding.pry

# list.unshift("A")
new_node = Node.new("A")
root = new_node
new_node.next = nil

# binding.pry

# list.unshift("B")
new_node = Node.new("B")
new_node.next = root
root = new_node

# binding.pry

# list.unshift("C")
new_node = Node.new("C")
new_node.next = root
root = new_node

# binding.pry

# list.unshift("D")
new_node = Node.new("D")
new_node.next = root
root = new_node

binding.pry

current = root
binding.pry
while current != nil
  binding.pry
  puts current
  current = current.next
end


# Your assignment is to add C, and D to the list,
# follow the powerpoint slides : )

# Code this:
# you cannot use a, b, c, or d in your code:
# Given a root, how do you traverse the entire linked list??
# i.e. given root that points to a node
# which links to a list of any size
# how would you iterate through each element
# and print out their values?

# hint: you may need current = current.next somewhere...


