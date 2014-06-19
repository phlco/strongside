require 'pry'

def say_good_morning(name)
  puts "Good Morning #{name}!"
end

def say_goodnight
  puts "Goodnight!"
end

def call_method
  yield
end

def call_method_with_input_1
  yield(1)
end

def call_method_with_one_input(input)
  yield(input)
end

def call_method_with_two_inputs(input1, input2)
  yield(input1, input2)
end

# this is a block
call_method do
  say_goodnight
end

call_method_with_input_1 do |num|
  puts num
end

call_method_with_one_input("Jonathan") do |name|
  say_good_morning(name)
end

call_method_with_two_inputs(1, 2) do |x, y|
  puts x + y
end


