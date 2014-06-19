require 'pry'
require "pry-debugger"
require "pry-stack_explorer"

def say_good_morning(name)
  puts "Good Morning #{name}!"
end

def say_good_night
  puts "Good Night!"
end

def call_method
  yield
end

# call_method do
#  say_good_morning
#  say_good_night
# end

# call_method do
#  say_good_night
# end

def call_method_with_input_1

  puts "This is before the yield!"
  yield(1)
  puts "This is AFTER the yield!"
end

# binding.pry

call_method_with_input_1 do |num|
  # binding.pry
  puts num
end

# Write a method called call_method_with_input_jonathan to call the good morning method to say good morning jonathan

def call_method_with_input_jonathan
  yield("Jonathan")
end

call_method_with_input_jonathan do |name|
  puts "Good Morning #{name}"
end

def call_method_with_one_input(input)
  puts "before the yield"
  yield(input)
  puts "after the yield"
end

call_method_with_one_input("Jonathan") do |name|
  puts "Good morning #{name}"
end
