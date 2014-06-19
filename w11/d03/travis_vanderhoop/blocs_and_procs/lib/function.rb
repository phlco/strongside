require 'pry'
require "pry-debugger"
require "pry-stack_explorer"



def say_good_morning(name)
  puts "Good Morning #{name}!"
end

def say_good_night
  puts "Good NIght!"
end

def call_method
  yield
end

# call_method do
#   say_good_morning
#   say_good_night
# end

# call_method do
#   say_good_night
# end



def call_method_with_input_1
  binding.pry
  puts "This is before the yield!"
  yield(1)
  puts "This is AFTER the yield!"
end

# binding.pry

# call_method_with_input_1 do |num|
#   # binding.pry
#   puts num
# end

# def call_method_with_input_jonathan
#   yield("Jonathan")
# end

# call_method_with_input_jonathan do |name|
#   say_good_morning(name)
# end



# PROBLEM 1
# Write a method called call_method_with_input_jonathan to call the good morning method to say good morning jonathan



# PROBLEM 2
def call_method_with_one_input(input)
  binding.pry
  puts "before the yield"
  yield(input)
  puts "after the yield"
end

# binding.pry
# call_method_with_one_input("Jonathan") do |name|
#   binding.pry
#   puts "Good Morning #{name}"
# end



# Use call_method to run say_good_night

def call_method_with_two_inputs(x, y)
  yield(x, y)
end

call_method_with_two_inputs(1, 2) do |x, y|
  puts ("#{x}, #{y}")
end


