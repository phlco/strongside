namespace :scrape do
  desc "this is a test"
  task :test do
    puts "this works"
  end

  desc "scrape first class"
  task :first do
    puts ""
    url = 'http://www.encyclopedia-titanica.org/titanic-first-class-passengers/'
    response = HTTParty.get(url)
    doc = Nokogiri::HTML(response)
    doc.css('span[itemprop=name]')
  end
end
