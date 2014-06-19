require_relative "node"
require_relative "linked_list"


ll = LinkedList.new
      ll.unshift("C")
      ll.unshift("B")
      ll.unshift("A")


binding.pry


# step 1
# UNSHIFT
# root = nil

# # step 2
# # list.unshift("A")
# a = Node.new("A")
# a.next = nil
# root = a

# # step 3
# # list.unshift("B")
# b = Node.new("B")
# b.next = root
# root = b

# # step 4
# # list.unshift("C")
# c = Node.new("C")
# c.next = root
# root = c

# # step 5
# # list.unshift("D")
# d = Node.new("D")
# d.next = root
# root = d

# # list out every node in the linked list
# current = root
# until current.value == nil
# 	puts current
# 	current = current.next
# end





