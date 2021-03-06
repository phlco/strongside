require 'active_record'
require 'csv'
require 'pry'
require_relative 'programmer.rb'


ActiveRecord::Base.logger = Logger.new( STDOUT )

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "KS",
  :password => "",
  :database => "programming_db"
)

# p "Enter the csv file name"
# file = gets.downcase.chomp!

programmers = CSV.parse(File.read('programmers.csv'))
programmers.each do |person|

  name = person[0]
  twitter_username = person [1]
  twitter_pic = person[2]
  github = person[3]

Programmer.create( { :name => name, :twitter_pic => twitter_pic, :twitter_username => twitter_username, :github => github } )
end

ActiveRecord::Base.connection.close



