namespace :scrape do

  desc "this is going to scrape first class passenger page"
  task :first do
    require 'nokogiri'
    require 'httparty'

    first_class = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
    response = HTTParty.get(first_class)
    doc = Nokogiri::HTML(response)
    puts doc
  end




end
