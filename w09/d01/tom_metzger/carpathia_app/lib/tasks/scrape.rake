namespace :scrape do

  desc "this is a test"
  task :test do
    puts "this works"
  end

  desc "scrape first class"
  task :first do
    puts "scraping first class"

    url = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
    response = HTTParty.get(url)
    doc = Nokogiri::HTML(response)
    names = doc.css('span[itempop=name]')
    survivors = #finish this
    names.each do |name|
      last_name = name.content.split(',')[0].titleize
      first_name = name.content.split(',')[1]
      puts first_name + last_name
    end
    # doc.css will pull DOM elements by the css element, classes are pulled without any prefix and separated by a space, classes use a . and ids use a #
  # this is a refactor of some of the code above, it loops through each table row and
  doc.css('tbody tr').each do |tr|
    puts tr.children[5].content.strip
    puts tr.children[3].content.strip
  end

  survivors[:names].each_with_index do |name, index|
    User.create(name: name, age: survivors[:ages][index], travel_class: )

  puts User.all.count

end
