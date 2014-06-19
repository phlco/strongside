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
    # this also works:
    # for i in self
    #   yield(i)
    # end
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

  def my_select
    puts "my select"
    new_array = []
    len = self.length
    len.times do |i|
      if yield(self[i]) == self[i]
        new_array << self[i]
      end
    end
    puts new_array
  end

  def my_reject
    puts "my reject"
    new_array = []
    len = self.length
    len.times do |i|
      if yield(self[i]) != self[i]
        new_array << self[i]
      end
    end
    puts new_array
  end

  # def my_inject(sym)
  #   puts "my inject"
  #   len = self.length
  #   len.times do |i|
  #     yield(self[i])
  #   end
  # end

end

array = ["Piggy", "Porky", "Bacon"]

# EACH:
# array.each do |el|
#   puts el
# end

array.my_each do |el|
  puts el
end

# EACH WITH INDEX:
# array.each_with_index do |el, i|
#   puts "#{el} is at index #{i}"
# end

array.my_each_with_index do |el, i|
  puts "#{el} is at index #{i}"
end

# MAP:
# puts array.map { |i| i * 2 }

puts array.my_map { |i| i * 2 }

# SELECT:
puts array.select { |i| i == "Porky" }

puts array.my_select { |i| i == "Porky" }

# REJECT:
puts array.reject { |i| i == "Porky" }

puts array.my_reject { |i| i == "Porky" }

#INJECT:
puts array.inject(:+)

# puts array.my_inject(:+)






