# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cat.delete_all

c1 = Cat.create image_url: "http://everydayfunnyfunny.com/wp-content/uploads/2010/10/sexy-big-tail-cat.jpg", name: "Sylvester", age: 3, tagline: "Mr. KoolKat"
c2 = Cat.create image_url: "http://farm3.static.flickr.com/2673/4157065225_23f5c080fd.jpg", name: "Larry", age: 3, tagline: "Hey Baby"


c3 = Cat.create image_url: "http://farm7.staticflickr.com/6046/6405325917_718414c995_b.jpg", name: "Toontzes", age: 3, tagline: "Mo' $$$"


c4 = Cat.create image_url: "http://www.importatlanta.com/forums/attachments/off-topic/185626d1238784676-jay-em-piktar-threads-whoreslounge-edition-sexy-cat.jpg", name: "Jane", age: 3, tagline: "purrrrr"
