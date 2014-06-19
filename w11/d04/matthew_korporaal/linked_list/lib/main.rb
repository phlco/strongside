require_relative "node"

root = nil

# Unshift

# binding.pry

# list.unshift("A")
a = Node.new("A")
root = a
a.next = nil

# binding.pry

# list.unshift("B")
b = Node.new("B")
b.next = root
root = b

# binding.pry

# list.unshift("C")
c = Node.new("C")
c.next = root
root = c

# binding.pry

# list.unshift("D")
d = Node.new("D")
d.next = root
root = d

binding.pry

current = root
binding.pry
while current != nil
  binding.pry
  puts current
  current = current.next
end