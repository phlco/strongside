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

	def print_all
		current = self.root
		until current.value == nil
			puts current
			current = current.next
		end
	end

	def to_a
		new_array = []
		current = self.root
		until current == nil
			new_array << current.value
			current = current.next
		end
		new_array
	end

end


list = LinkedList.new
