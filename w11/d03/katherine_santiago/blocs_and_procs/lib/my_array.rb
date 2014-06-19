class Array

  def run_my_own_function
    puts "I ran my own function!"
  end

  def my_each
    len = self.length
    len.times do |i|
      el = self[i]
      yield(el)
    end
  end

  def my_each_with_index
    len = self.length
    len.times do |i|
      yield(self[i], i)
    end
  end

  def my_map
    len = self.length
    x = []
    len.times do |i|
      el = self[i]
      x << yield(el)
    end
    return x
  end

  def my_map!
  end

end


array = ["Piggy", "Porky", "Bacon"]
# array.my_each
# array.each_index {|x| puts x}

array.each do |x|
  puts "#{x} was here"
end
puts array

array2 = []
array.map do |x|
  thing = "#{x}!!!!"
  array2 << thing
end
puts array
puts array2

a2 = ["apple", "pear", "cherry"]

a2.my_map do |el|
  puts "#{el} was





# array.each_index do |x|
#   puts x
# end

# array.my_each_with_index do |el, i|
#   puts "#{el} is at index #{i}"
# end

# array.my_each do |el|
#   puts el
# end