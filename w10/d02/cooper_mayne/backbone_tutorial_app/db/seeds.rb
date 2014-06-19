# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.delete_all
User.create(name: 'Cooper Mayne', age: 26)
User.create(name: 'Same Mayne', age: 30)
User.create(name: 'Jbear', age: 23)
User.create(name: 'A-Money', age: 27)
