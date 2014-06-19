# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat1 = Cat.create(name: 'Hobbes', age: 2, tag_line: 'Obsessed with my own tail', image_url: 'http://newsfirst.lk/english/sites/default/files/cat.jpg')
cat2 = Cat.create(name: 'Calvin', age: 2, tag_line: 'purrr', image_url: 'http://www.helpinghomelesscats.com/images/cat1.jpg')
