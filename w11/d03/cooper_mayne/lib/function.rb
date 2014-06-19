require 'pry'

def say_good_morning name
  puts "Good Morning, #{name}!"
end

def call_method_with_input_1
  yield('cooper')
  yield('jon')
end

def call_method name
  yield(name)
end

call_method_with_input_1 do |name|
  say_good_morning(name)
end

call_method('jonathan') do |name|
  say_good_morning(name)
end

def call_method_2(name,last)
  yield(name, last)
end

call_method_2('jonathan', 'joe') do |name, last|
  puts name + last
end
