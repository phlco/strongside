require 'pry'

def say_goodnight
  puts "Good Morning"
end

def say_good_morning
  puts "Good Morning!"
end

def call_method
  yield()
end

# yield & blocs => anonymous method in javascript

# call_method do
#   say_good_morning
# end


# call_method do
#   say_goodnight
# end

def new_method
  yield(333)
end

new_method do |num|
  puts num
end

# PROBLEM 1
# Write a method called call_method_with_input_jonathan to call
# the good morning method to say good morning jonathan

def call_method_with_input_jonathan
  yield("jonathan")
end

call_method_with_input_jonathan do |name|
  puts "Good Morning #{name}"
end

def call_method(name)
  yield(name)
end

# PROBLEM 2
# call_method("Jonathan") do
  # put something in here to make it say "Good Morning Jonathan"
# end

call_method("Jonathan") do |name|
  puts "Good Morning #{name}"
end


def call_method_with_two_inputs(x, y)
  yield(x, y)
end

call_method_with_two_inputs(1, 2) do |x, y|
  puts ("#{x}, #{y}")
end


