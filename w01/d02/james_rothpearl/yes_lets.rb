#  while  something_is_true  do

# end

# counter = 0
# something = 10

# while  counter  <  something do
  # puts "cool stuff"
  # counter += 1
  # coiunter = counter + 1

# end

# Yes Let's

awesome_things = []
counter = 0

puts "Do you wanna play Yes Let's?"
print "y/n"
input = gets.chomp!


while input == 'y' && counter < 5
   counter += 1

   puts  "ok we're' playing"

   puts "What do you wanna do?!"
   awesome_thing = gets.chomp!


   awesome_things << awesome_thing

   puts "Do you STILL wanna play Yes Let's??"
   input = gets.chomp!

end


puts "No more than 5 rounds!"


# this will print a string with a carriage return of the array
puts awesome_things.inspect

# this prints a string without a carriage return of the array
print awesome_things.inspect

# print a string of the inspected string of the array
p awesome_things.inspect

# printing and inspecting
p awesome_things
