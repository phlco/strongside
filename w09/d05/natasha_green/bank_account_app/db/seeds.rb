# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Account.delete_all

users = User.create(name: "Natasha Green")
#this will create an object called Natasha Green
accounts = Account.create(name: "John Doe", balance: 5, user_id: users.id)
accounts = Account.create(name: "Jane Doe", balance: 10, user_id: users.id)


users1 = User.create(name: "Mike Green")
accounts = Account.create(name: "Play", balance: 20, user_id: users1.id)
accounts = Account.create(name: "Work", balance: 30, user_id: users1.id)

#this will create an accounts objec.
#the column user_id will equal the user object created on line 10
#users is the object and the .id is a property on the user.


#keep head up about short cut when doing a deed file.






