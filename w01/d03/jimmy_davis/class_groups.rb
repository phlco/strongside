# Make a program that will return a group of classmates

def ask(question)
  puts(question)
  answer = gets.chomp!
end

# Students should be randomly chosen from this array
# In the array, students.sample will randomly choose students
# create a method that will return the students randomly
# they will then be grouped based on how many per group the user wants

STUDENTS = [
  "Alex Hint",
  "Amy Ruan",
  "Ana Giraldo-Wingler",
  "Cooper Mayne",
  "Diego Palma",
  "Edward Shin",
  "Enoch Riese",
  "Harrison Powers ",
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
  "Quin Cogdell ",
  "Tom Metzger",
  "Travis Vanderhoop",
  "Will Smith",
  "Yaritza Rodriguez"
]

GROUP_NAMES = [
"The Musketeers",
"The Mouseketeers",
"We don't know what we're doing",
"Anti Kickhash",
"Help us",
"The Nobodies",
"Rat Faces",
"Team Witch Nose",
"The Ugly Ducklings",
"No-names",
"Un-cool",
"Crash Dummies"
]


# User should be able to decide the size of their group
# Ask the user how many people they want in their group
# Turn their answer into an integer
#create a method that will ask the person to choose how many
# people they want in their group and turn it into an interger


## this code will only work if the user selects to make groups of 3

def choose_a_group()
  group_size = ask("How many people do you want in your group?")
  group_size = group_size.to_i
  students1 = STUDENTS.sample
  students2 = STUDENTS.sample
  students3 = STUDENTS.sample
  students4 = STUDENTS.sample
  group_name = GROUP_NAMES.sample
  if group_size == 2
    puts "#{students1} and #{students2} are in #{group_name}"
  elsif group_size == 3
    puts "#{students1}, #{students2}, and #{students3} are in #{group_name}"
  elsif group_size == 4
    puts "#{students1}, #{students2}, #{students3} and #{students4} are in #{group_name}"
  end
end


# add a funny team name for each
# make different array of funny names to assign each group


# if there's a remainder student put them in the last group
# when there is a remainder, use .push to add the remainder student
# to the end of the group


choose_a_group
# name_the_group
