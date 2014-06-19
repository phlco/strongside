require_relative ("artist")
require_relative ('painting')

ActiveRecord::Base.logger = Logger.new( STDOUT )

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "vanderhoop",
  :password => "",
  :database => "moma_db"
)

a1 = Artist.new
a1.name = 'Van Gogh'
a1.nationality='Netherlands'
a1.save

a2 = Artist.new
a2.name = 'Harry Potter'
a2.nationality = 'England'
a2.save


p1 = Painting.new
p1.title = 'Starry Night'
p1.artist_id = a1.id
p1.save

p2 = Painting.new
p2.title = 'The Elves'
p2.artist_id = a2.id
p2.save

p3 = Painting.new
p3.title = 'Lord Voldemort'
p3.artist_id = a2.id
p3.save
