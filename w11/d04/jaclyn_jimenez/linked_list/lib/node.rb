require 'pry'

class Node

attr_accessor :value, :next

  def initialize(value)
    @value = value
  end

end

root = nil

a = Node.new("A")
root = a
a.next = nil

#inserting B

b = Node.new("B")
b.next = root
root = b

c = Node.new("C")
c.next = root
root = c

d = Node.new("D")
d.next = root
root = d

current = root
while current != nil
  puts current.value
  current = current.next
end

# index = 0
# while current != nil
#   puts "#{index} is index of #{current.value}"
#   current = current.next
#   index = index + 1
# end


# binding.pry
