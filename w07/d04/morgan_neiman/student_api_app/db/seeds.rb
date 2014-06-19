# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
file = File.open("kick_hash.csv", "r")
file.gets

file.each_line do |line|
  line_array = line.split(",")
  student = Student.new
  student.name = line_array[0]
  student.image_url = line_array[4]
  student.email = line_array[5]
  student.save
end