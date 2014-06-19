require 'pry'

def say_good_morning(name)
  puts "Good Morning #{name}!"
end

def say_good_night
	puts "Good Night!"
end

def call_method
  yield()
end


# Practice 1------------------------------------------------------
		# This 

# call_method do
#   binding.pry
#   say_good_morning
#   say_good_morning
# end


# call_method do
# 	say_good_night
# end

# Practice 2------------------------------------------------------
		# This takes an input and passes it into the yielded function

# def call_morning_with_input_Jonathan
# 	yield("jonathan")
# end

# call_morning_with_input_Jonathan do |foo|
# 	say_good_morning(foo)
# end

		# My rif on Practice 2--------------------------------------
				# bar = ['junk', 'more stuff']

				# def call_morning_with_input_Jonathan(bar2)
				# 	yield(bar2)
				# end

				# bar.each do |this|
				# 	call_morning_with_input_Jonathan(this) do |foo|
				# 		say_good_morning(foo)
				# 	end	
				# end


# Practice 2------------------------------------------------------
	# handling two inputs


def call_method_with_two_inputs(x, y)
	yield(x, y)
end

call_method_with_two_inputs(1, 2) do |x, y|
	puts "#{x}, #{y}"
end







