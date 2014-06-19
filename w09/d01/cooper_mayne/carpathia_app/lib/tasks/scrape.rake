require 'nokogiri'
require 'httparty'
require 'pry'

task :scrape => :environment do

  first_class = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
  second_class = "http://www.encyclopedia-titanica.org/titanic-second-class-passengers/"
  third_class = "http://www.encyclopedia-titanica.org/titanic-third-class-passengers/"

  [first_class, second_class, third_class].each {|site| scrape_em site }
end

def scrape_em url
  response = HTTParty.get(url)
  doc = Nokogiri::HTML(response)
  table = doc.css('#myTable')
  body = table.css('tbody')

  body.children.each do |row|
    u = User.new
    name = row.children[2].content.strip
    last_name = name[/^.+,\s/]
    name.sub!(last_name, "")
    last_name.sub!(", ", "")
    last_name.downcase!.capitalize!
    name = [name, last_name].join(" ")
    age = row.children[4].content.strip
    travel_class = row.children[6].content.strip

    u.name = name
    u.age = age
    u.travel_class = travel_class
    u.save
  end
end
