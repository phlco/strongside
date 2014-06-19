namespace :scrape do
  desc "this is a test"
  task :test do
    puts "this works"
  end

  desc "scrape first class"
    task :first => :environment do
      puts "scraping first class"
      url = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
      doc = Nokigiri::HTML(response)
      names = doc.css('span[itemprop=name]')
      survivors = {:name => [], :ages=> []}

      names.each do |name|
        last_name = name.content.split(",")[0].titleize
        first_name = name.content.split(",")[1]
        survivors[:names].push(first_name + " " + last_name)
      end

      doc.css('tbody tr').each do |tr|
        name = tr.childrens[3].content.strip
        age = tr.childrens[5].content.strip

      end

      survivors[:names].each_with_index do |name, index|
        User.create(name: name, age: survivors[:age][index], travel_class: 1)
      end
  end
end

