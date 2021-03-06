students = [
    "Alex Hint",
    "Amy Ruan",
    "Ana Giraldo-Wingler",
    "Cooper Mayne",
    "Diego Palma",
    "Edward Shin",
    "Enoch Riese",
    "Harrison Powers",
    "Jaclyn Jimenez",
    "James Rothpearl",
    "Jimmy Davis",
    "Jorge Colindres",
    "Joshua Oynick",
    "Katherine Santiago",
    "Matt Lucas",
    "Matthew Korporaal",
    "Morgan Neiman",
    "Natasha Green",
    "Quin Cogdell",
    "Tom Metzger",
    "Travis Vanderhoop",
    "Will Smith",
    "Yaritza Rodriguez"
    ]

group_names = [
    "The Cheese Smellies",
    "The Twinkle Toes",
    "The Weiner Blasters",
    "The Fantastic Farts",
    "The Nancies",
    "The Dumpsters",
    "Team Z-List",
    "Team Mediocre",
    "The Ninnies",
    "Team Eating Bogies",
    "The Strange Smells"
    ]

#ask user desired group size
puts "How many people per group? Choose a number between 2 and 11."
group_size_str = gets.chomp
group_size = group_size_str.to_i

#shuffle 'students' array and slice into groups of group_size variable
groups = students.shuffle.each_slice(group_size).to_a

# check if last group only has one person in it
if groups.last.length == 1
  #add the last group to the second-to-last
  remainder =  groups[0..-3] + [groups[-2] + groups[-1]]
  #get rid of the last group
  puts "#{remainder}"
  #pop them into last array
else
  puts "#{groups}"
end
# assign a funny name to each group
assigned_name = group_names.sample((23 / group_size_str.to_f).ceil).to_a
puts "Here are your group names, in order: #{assigned_name}"

# names_and_groups = assigned_name[0..11] + groups[0..11]
# puts "#{names_and_groups}"

# find out the remainder using modulo (%)
# remainder = 23 % group_size
#add remainder to last group