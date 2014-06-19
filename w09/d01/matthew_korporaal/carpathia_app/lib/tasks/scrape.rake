require 'httparty'
require 'nokogiri'
require 'pry'
desc 'scrape passengers'
task :get_1st do
  first_class = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
  response = HTTParty.get(first_class)
  doc = Nokogiri::HTML(response)
  binding.pry
  names_array = []
  doc.css('span[itemprop=name]').each do |name|
    names_array << name.content
  end
  ages_array = []
  doc.css()
  classes_array = []

end

task :get_2nd do
  second_class = "http://www.encyclopedia-titanica.org/titanic-second-class-passengers/"
  response = HTTParty.get(second_class)
  doc = Nokogiri::HTML(response)
end

task :get_3rd do
  third_class = "http://www.encyclopedia-titanica.org/titanic-third-class-passengers/"
  response = HTTParty.get(third_class)
  doc = Nokogiri::HTML(response)
end
