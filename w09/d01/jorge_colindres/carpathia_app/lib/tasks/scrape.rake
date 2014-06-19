require_relative '../../app/models/user'

namespace :nokogiri do
  desc "This scrapes the encyclopedia-titanica website"
  task :scrape_titanic => :environment do
    first_class_response = HTTParty.get "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
    second_class_response = HTTParty.get "http://www.encyclopedia-titanica.org/titanic-second-class-passengers/"
    third_class_response = HTTParty.get "http://www.encyclopedia-titanica.org/titanic-third-class-passengers/"

    first_class = Nokogiri::HTML first_class_response
    second_class = Nokogiri::HTML second_class_response
    third_class = Nokogiri::HTML third_class_response

    first_class_passenger_names = []
    first_class_ages = []

    first_class.css('.fn').each do |passenger|
      prefix = passenger.css('span:nth-of-type(2)').to_s.gsub(/<\/?[^>]+>/, '')
      given_name = passenger.css('span:last').to_s.gsub(/<\/?[^>]+>/, '')
      family_name = passenger.css('span:first').to_s.gsub(/<\/?[^>]+>/, '')

      full_name = "#{prefix} #{given_name} #{family_name}"
      first_class_passenger_names << full_name
    end

    first_class.css('.tablesorter td:nth-of-type(3)').each do |age_scraped|
      if age_scraped.css('a').to_s.gsub(/<\/?[^>]+>/, '') == ''
        first_class_ages << nil
      else
        first_class_ages << age_scraped.css('a').to_s.gsub(/<\/?[^>]+>/, '')
      end
    end

    first_class_passenger_names.each_with_index do |passenger, i|
      user = User.new
      user.name = passenger
      user.age = first_class_ages[i]
      user.class = 'first'
    end

  end
end
