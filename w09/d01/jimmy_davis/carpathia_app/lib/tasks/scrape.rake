require 'nokogiri'
require 'httparty'

namespace :scrape do
  desc "Get all first class"
  task :first => :environment do

    url = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
    response = HTTParty.get(url)
    doc = Nokogiri::HTML(response)
    names = doc.css('span[itemprop=name]')

    names.each do |name|
      last_name = name.content.split(',')[0].titleize
      first_name = name.content.split(',')[1]
      puts first_name + last_name
    end
    ages = doc.css('tbody tr')
    ages.each do |age|
      puts age.children[5].content
    end
  end

  desc "Get all second class"
  task :second do

    second_class = "http://www.encyclopedia-titanica.org/titanic-second-class-passengers/"

  end

  desc "Get all third class"
  task :third do

    third_class = "http://www.encyclopedia-titanica.org/titanic-third-class-passengers/"

  end
end



first_class_names_array = []

doc.css('.fn span').each do |name|
  puts name.content
  first_class_names = name.content
  first_class_names_array.push(first_class_names)
end

second_class_response = HTTParty.get(second_class)
doc = Nokogiri::HTML(second_class_response)

second_class_names_array = []

doc.css('.fn span').each do |name|
  puts name.content
  second_class_names = name.content
  second_class_names_array.push(second_class_names)
end

third_class_response = HTTParty.get(third_class)
doc = Nokogiri::HTML(third_class_response)

third_class_names_array = []

doc.css('.fn span').each do |name|
  puts name.content
  third_class_names = name.content
  third_class_names_array.push(third_class_names)
end
