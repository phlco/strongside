class Scraper
  def initialize(options)
    @url = options[:url]
  end

  def get_hrefs
    response = HTTParty.get(@url)
    doc = Nokogiri::HTML(response)
    links = []
    doc.css('a').each do |t|
      links << t.attribute('href').text if t.attribute('href')
    end
    return links
  end

  def get_images
    response = HTTParty.get(@url)
    doc = Nokogiri::HTML(response)
    images = []
    doc.css('img').each do |t|
      images << t.attribute('src').text  if t.attribute('src')
    end
    return images
  end
end

# doc.css('a')[2].attribute('href')