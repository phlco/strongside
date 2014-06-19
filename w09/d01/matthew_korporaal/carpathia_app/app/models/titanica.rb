class Titanica

  def self.scrape_url(url)
    survivors = []

    response = HTTParty.get(url)
    doc = Nokogiri::HTML(response)
    doc.css('table.tablesorter tr').each_with_index do |row, row_index|
      next if row_index == 0

      person = {}
      survivors << person

      row.css('td').each_with_index do |col, col_index|
        case col_index
        when 1 # name
          name = col.text.gsub("\n", "").gsub(/(\s\s)+/, "")
          person[:name] = name
        end
      end

    end

    binding.pry
  end

end