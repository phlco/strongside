require 'pry'
require 'rainbow'

class Array

  def run_my_own_function
    puts "\nARRAY::2.0".underline.bright
  end

  def my_each
    self.length.times do |i|
      yield(self[i])
    end
  end

  def my_each_with_index
    self.length.times do |i|
      yield(self[i], i)
    end
  end

  def my_map
    new_array = []
    for el in self
      new_array << yield(el)
    end
    new_array
  end

  def my_map!
    self.length.times do |i|
      self[i] = yield(self[i])
    end
    self
  end

  def my_select
    new_array = []
    self.length.times do |i|
      new_array << self[i] if yield(self[i])
    end
    new_array
  end

  def my_reject
    new_array = []
    self.length.times do |i|
      new_array << self[i] unless yield(self[i])
    end
    new_array
  end

  def my_reduce(operator)
    self.inject(operator[0])
  end

end

array = ["Pig","Pork","Backon"]
array_o_nums = [1, 3, 2]

array.run_my_own_function

# el is whole array
puts "\n.each ['Pig','Pork','Backon']"
array.my_each { |el| puts "EACH: #{el}" }
puts "\n.each_with_index ['Pig', 'Pork', 'Backon']"
array.my_each_with_index { |el, i|  puts "EACH: #{el} @INDEX: #{i}" }

puts "\n.map +Penelope"
puts array.my_map { |el| el + "Penelope" }
puts "\n.map! downcase"
puts array.my_map! { |el| el.downcase }

puts "\n.select even steven [1,3,2]"
puts array_o_nums.my_select { |el| el % 2 == 0 }

puts "\n.reject even steven [1,3,2]"
puts array_o_nums.my_reject { |el| el % 2 == 0 }

puts "\n.reduce ['Pig'+'Pork','Backon']"
puts array.my_reduce(:+)

puts "\n.reduce [1+3+2]"
puts array_o_nums.my_reduce(:+)

