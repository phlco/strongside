require 'nokogiri'
require 'HTTParty'

namespace :scrape do
  desc "this is going to scrape a site"
  task :first => :environment do

    url = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
    response = HTTParty.get(url)
    doc = Nokogiri::HTML(response)

    names = doc.css('span[itemprop=name]')
    survivors = {:names => [], :ages => []}

    names.each do |name|
      last_name = name.content.split(',')[0].titleize
      first_name = name.content.split(',')[1]
      survivors[:names].push(first_nane + last_name)
    end
    doc.css('tbody tr').each do |tr|
       puts tr.children[5].content
  end
  survivors[:names].each do |name|
    User.create(name: name)
end

  # User.create(:name => name, :age => age, :travel_class => travel_class)
end
