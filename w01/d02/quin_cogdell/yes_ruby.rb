
awesome_things = []
#times_played = awesome_things.length   #didn't work because l
limit = 5
puts "Do you wanna play Yes Let's"
print "y/n"


input = gets.chomp!
while input == 'y'  &&  awesome_things.length< limit do
  puts "ok we're playing..."

  puts "What do you want to do?!"
  awesome_thing = gets.chomp!

  awesome_things << awesome_thing

  puts "Do you STILL wana play Yes Let's??"
  input = gets.chomp!

end


#print a string with a carriage return of the array
#puts awesome_things.inspect

# this print a string without a carriage return of the array
#print awesome_things.inspect

# print a string of the inspected string of the array
#p awesome_things.inspect

# printing and inspecting
#p awesome_things