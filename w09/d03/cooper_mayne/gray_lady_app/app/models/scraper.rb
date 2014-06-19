class Scraper 
  attr_accessor :url

  def initialize url
    @url = url
  end

  def get_hrefs
    links = []
    response = HTTParty.get(@url)
    html_doc = Nokogiri::HTML(response)
    html_doc.css('a').each do |link|
      links << link.attributes['href'].value
    end
    links
  end

  def get_images
    response = HTTParty.get(@url)
    response.scan(/src=(.*.(jpg|bmp|png|jpeg))/).map do |a|
      a.first.gsub(/"/, "")
    end
  end
end
