# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

people = CSV.parse(File.read('programmers.csv'))

people.each do |person|
  name = person[0]
  twitter_username = person[1]
  twitter_pic = person[2]
  entry = Programmer.create({:name =>name, :twitter_username => twitter_username, :twitter_pic => twitter_pic})
end