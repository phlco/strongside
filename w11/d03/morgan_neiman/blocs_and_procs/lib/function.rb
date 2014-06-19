require 'pry'

def say_good_morning(name)
  puts "Good Morning #{name}!"
end

def say_good_night
  puts "Good Night"
end

def call_method
  yield("Morgan")
end

def call_method_2(name)
  yield(name)
end

call_method do |name|
  say_good_morning(name)
end

def call_method_with_input_1
  yield(1)
end

call_method_with_input_1 do |num|
  puts num
end

call_method_2("Morgan") do |name|
  say_good_morning(name)
end

def call_method_with_two_inputs(x, y)
  yield(x, y)
end

call_method_with_two_inputs(5, 2) do |x, y|
  puts(x, y)
end