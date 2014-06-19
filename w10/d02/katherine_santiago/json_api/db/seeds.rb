# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Owner.create(name: "Joe")
Machine.create(location: "barber shop", owner_id: 1)
Machine.create(location: "pizza place", owner_id: 1)
Machine.create(location: "laundromat", owner_id: 1)