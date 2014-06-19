namespace :scrape do

  desc "scrape first class encyclopedia-titanica"
  task :first => :environment do

    first_class = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
    response = HTTParty.get(first_class)
    doc = Nokogiri::HTML(response)
    doc.css('tbody tr').each do |tr|
      tds = tr.css('td')
      name_parts = tds[1].content.split(',').map(&:strip)
      name = "#{name_parts[1]} #{name_parts[0].titleize}"
      age = tds[2].content.strip
      User.create(name: name, age: age, travel_class: 'first class')
    end

  end

  desc "scrape second class encyclopedia-titanica"
  task :second => :environment do

    second_class = "http://www.encyclopedia-titanica.org/titanic-second-class-passengers/"
    response = HTTParty.get(second_class)
    doc = Nokogiri::HTML(response)
    doc.css('.fn').each do |name|
      name_parts = name.content.split(',').map(&:strip)
      age = name.ancestors('td').first.next_sibling.next_sibling.content.strip
      name = "#{name_parts[1]} #{name_parts[0].titleize}"
      User.create(name: name, age: age, travel_class: 'second class')
    end

  end

  desc "scrape third class encyclopedia-titanica"
  task :third => :environment do

    third_class = "http://www.encyclopedia-titanica.org/titanic-third-class-passengers/"
    response = HTTParty.get(third_class)
    doc = Nokogiri::HTML(response)
    doc.css('tbody tr').each do |tr|
      tds = tr.css('td')
      name_parts = tds[1].content.split(',').map(&:strip)
      name = "#{name_parts[1]} #{name_parts[0].titleize}"
      age = tds[2].content.strip
      User.create(name: name, age: age, travel_class: 'third class')
    end
  end

  desc "import all"
  task :all => [:first, :second, :third] do
    puts "scraping"
  end

end
