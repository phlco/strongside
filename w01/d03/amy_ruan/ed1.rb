TEAM_NAME = [
"Thunder Cats",
"Team Voldemort",
"USA",
"My Little Ponies",
"Princess Conzuela Banana Hammock",
"Crap Bag",
"Thug Life",
"Flava of Love",
"G-Unit",
"The Lancasters",
"Hash Kickers",
"Spice Girls"]


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
"Yaritza Rodriguez"]

def random_slice(size)
  groups = STUDENTS.shuffle.each_slice(size).to_a {|a| p a}
  print groups
group_hash = {}

  i = 0
  while i <= groups.length
  puts ""
  puts "i is #{i}"
  puts "the group length is #{groups.length}"
    i = i + 1
    group_hash[TEAM_NAME.sample] = groups[i]
    puts ""
    puts "the hash is #{group_hash}"
  end
  print group_hash
end





random_slice(6)