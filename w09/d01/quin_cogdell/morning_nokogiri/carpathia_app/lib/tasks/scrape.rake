namespace :scrape do


  # second_class = "http://www.encyclopedia-titanica.org/titanic-second-class-passengers/"
  # third_class = "http://www.encyclopedia-titanica.org/titanic-third-class-passengers/"

  desc "This scrapes the first class"
  task :first_class_quin => :environment do
    first_class_url = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
    response_str = HTTParty.get(first_class_url)
    doc = Nokogiri::HTML(response_str)
    rows = doc.css('tbody tr')
    rows.each do |passenger|
      prefix = passenger.css('span[itemprop=honorificPrefix]').inner_text
      family_name = passenger.css('span[itemprop=familyName]').inner_text.titleize
      given_name = passenger.css('span[itemprop=givenName]').inner_text
      name = prefix + " " + given_name + " " + family_name
      age = passenger.children[5].content.strip
      User.create(name: name, age: age, travel_class: 'first')
    end
    puts User.count
  end


# incomplete in class example
  desc "This scrapes the first class"
  task :first_class => :environment do
    first_class_url = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
    response_str = HTTParty.get(first_class_url)
    doc = Nokogiri::HTML(response_str)
    names = doc.css('span[itemprop=name]')

    names.each do |name|
      last_name = name.content.split(',')[0].titleize
      first_name = name.content.split(',')[1]
      puts first_name + last_name
    end

    doc.css('tbody tr').each do |tr|
      puts tr.children[5].content
    end
  end




end
