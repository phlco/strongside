task :greet do
  puts "Hello World!"
end

task :titanic => :environment do
  first_class = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
  second_class = "http://www.encyclopedia-titanica.org/titanic-second-class-passengers/"
  third_class = "http://www.encyclopedia-titanica.org/titanic-third-class-passengers/"

  response = HTTParty.get(first_class)
  doc = Nokogiri::HTML(response)

  doc.css('.fn').each do |name|
    fullname = name.content
    fullname.slice! ','
    fullnamearray = fullname.to_s.split
    # fullnamearray.first(1).map![0].titleize
    puts fullnamearray
    binding.pry
  end

end


