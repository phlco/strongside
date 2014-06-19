require 'pry'

class Array

  def run_my_own_function
    puts "I ran my own function!!!!"
  end

  def my_each

    len = self.length

    len.times do |i|
      # binding.pry
      yield(self[i])
    end

  end

  def my_each_with_index

    len = self.length

    len.times do |i|
      yield(self[i], i)
    end

  end

end

array = ["Piggy", "Porky", "Bacon"]

array.my_each_with_index do |el, i|
  puts "#{el} is at index #{i}"
end

#my_each_with_index




# array.each do |el|
#   puts el
# end

# array.each do |el|
#   puts el
# end

