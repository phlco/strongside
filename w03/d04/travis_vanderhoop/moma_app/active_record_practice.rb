require 'pry'
require_relative ("artist")
require_relative ('painting')
require 'active_record'

ActiveRecord::Base.logger = Logger.new( STDOUT )

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "vanderhoop",
  :password => "",
  :database => "moma_db"
)
#I want to return all instances of the Artist class.
output = Artist.all.map

output = []
Artist.all.each do |artist|
  output << artist
end

p output

output = Artist.all.map do |artist|
  artist
end

p output
#I expect output to be an array.
# outpp output.class == Array
binding.pry
#I expect the exact output to be [a1, a2]
p output == [a1, a2]
binding.pry
#==============================
#==============================
#==============================

#I want to return all instances of painting.
output = Painting.all
#I expect the output to be an array
p output.class == Array
binding.pry
#I expect output to be 3
p output == [p1, p2, p3]
binding.pry
#==============================
#==============================
#==============================

#I want to return the a2 object
output = Artist.find(2)
#I expect the output type to be an instance of the Artist class.
p output.class == Artist
binding.pry

#I expect the output to be the a2 object
p output == a2
binding.pry
#==============================
#==============================
#==============================

#I want to return the artist with a name of "Van Gogh"
output = nil
Artist.all.each do |artist|
  if artist.name == 'Van Gogh'
    output = artist
  end
end
p output.class == Artist
binding.pry
#I expect the explicit output to be a1

p outout == a1
binding.pry




