require 'nokogiri'
require 'httparty'

namespace :titanic do

  desc 'Fetch first class'
  task :first => :environment do
    url = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
    response = HTTParty.get(url)
    doc = Nokogiri::HTML(response)
    survivors = {:names => [], :ages => []}

    names = doc.css('span[itemprop=name]')
    names.each do |name|
      last_name = name.content.split(',')[0].titleize
      first_name = name.content.split(',')[1].titleize
      survivors[:names].push(first_name + last_name)
    end

    ages = doc.css("a[href*='/titanic-ages/']")
    ages.each do |age|
      age = age.content
      survivors[:ages].push(age)
    end


  end



end