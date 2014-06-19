require 'pry'


class Array

	def run_my_own_function
		puts "I ran my own function"
	end


	def my_each
		len = self.length
		len.times do |i|
			yield(self[i])
		end
	end


	def my_each_with_index
		len = self.length
		len.times do |i|
			yield(self[i], i)
		end
	end

	def my_map
		new_array = []
		len = self.length
		len.times do |i|
			new_array[i] = yield(self[i])
		end
		new_array
	end

	def my_select()
		new_array = []
		len = self.length
		len.times do |i|
			new_array.push(self[i]) if yield(self[i])
		end
		new_array
	end

end


array = ["piggy", "porky", "bacon"]
# array.run_my_own_function



# calling my_each
	# array.my_each do |el|
	# 	puts el
	# end

# calling my_each_with_index
	# array.my_each_with_index do |el, i|
	# 	puts "#{el} is at index #{i}"
	# end

# calling my_map
	# foo = array.my_map {|el| el * 2}
	# puts foo
	# puts foo.class


# other methods to model
# inject
# select
# reject
# keep if

# calling my_select
array1 = %w{b, i, n, g, o}
foo = array1.my_select{|letter| letter == "o"}
puts foo
puts foo.class







