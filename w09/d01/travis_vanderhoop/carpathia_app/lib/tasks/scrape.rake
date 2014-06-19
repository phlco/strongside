require 'nokogiri'
require 'httparty'

namespace :titanic do      # here, 'titanic' is set as the namespace, the equivalent of 'db' in rake db:migrate
  desc "scrapes titanic manifest"
  # 'scrape' is the name you're giving to the action, the equivalent of 'migrate' in rake db:migrate
  # :environment sets the environment to the rails environment, so the rake task will have access to the models and stuff
  task :scrape => :environment do

    first_class = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
    second_class = "http://www.encyclopedia-titanica.org/titanic-second-class-passengers/"
    third_class = "http://www.encyclopedia-titanica.org/titanic-third-class-passengers/"

    # this gets all the html from the specified URL
    first_class_response = HTTParty.get(first_class)
    # second_class_response = HTTParty.get(second_class)
    # third_class_response = HTTParty.get(second_class)

    # NOKOGIRI turns everything into nodes
    first_class_doc = Nokogiri::HTML(first_class_response)


    first_class_passengers_array_messy = first_class_doc.css('tbody tr')
    # returns an array of each passenger, as they appear in messy row
    # TRAVIS, THE ENTIRE TABLE IS WRAPPED INSIDE A LARGER TABLE, SO WHEN YOU TARGET 'TR',
    # YOU'RE ACTUALLY TARGETING THE *ENTIRE TABLE* INSTEAD OF INDIVIDUAL ROWS

    # PEPTALK: DON'T FEEL BAD. INSTEAD OF TARGETING THE NAMES, WHICH YOU ACCOMPLISHED EASILY (see below),
    # first_class_doc.css('.fn span[itemprop=givenName]').children[0]
    # YOU REALIZED THAT LOOPING THROUGH TABLE ROWS WOULD ALLOW YOU TO PULL NAMES *AND* AGES IN ONE FELL SWOOP.
    # THE ONLY TROUBLE WAS, THIS TABLE WAS (STRANGELY) WRAPPED INSIDE ANOTHER TABLE

    first_class_passengers_array_messy.each do |passenger|
      last_name = passenger.css('span[itemprop="familyName"]').children[0].content
      first_name = passenger.css('span[itemprop="givenName"]').children[0].content
      name = first_name + " " + last_name.capitalize
      age = passenger.css('td a[href*="/titanic-ages"]').children[0].content.to_i unless passenger.css('td a[href*="/titanic-ages"]').children[0] == nil
      # binding.pry
      passenger_class = "First Class"
      User.create(:name => name, :age => age, :travel_class => "First Class")
    end

  end
end

