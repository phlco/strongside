require 'pry'

# def say_good_morning
#   puts "Good Morning!"
# end

# def call_method
#   yield()
# end

# binding.pry

# call_method do
#   say_good_morning
#   say_good_morning
# end


# def say_goodnight
#   puts "goodnight xo"
# end

# def call_method
#   yield
# end

# call_method do
#   say_goodnight
# end


# Pass args
def call_method_with_input_1
  yield(1)
end

call_method_with_input_1 do |num|
  puts num
end

def say_good_morning(name)
  puts "Good Morning #{name}!"
end

def call_method_with_Jon
  yield("Jon")
end

call_method_with_Jon do |x|
  say_good_morning(x)
end


def say_hi_to(&block)
  puts "Say hi #{block.call}"
end

say_hi_to { "Matt" }


def call_method_with_two_inputs(x, y)
  yield(x, y)
end

call_method_with_two_inputs(1, 2) do |x, y|
  puts ("#{x}, #{y}")
end

