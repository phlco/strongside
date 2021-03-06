class Apartment
  attr_accessor :sqft, :num_bedroom, :num_bath, :price, :aptID, :tenants

  def initialize(apartment_info_hash)
    @aptID = apartment_info_hash[:aptID]
    @sqft = apartment_info_hash[:sqft]
    @num_bedroom = apartment_info_hash[:num_bed]
    @num_bath = apartment_info_hash[:num_bath]
    @price = apartment_info_hash[:price]
    @tenants = []
  end

  def add_tenants(renters_a)
    #renters_a.length.times do |renter_index|
    #  @tenants << renters_a[renter_index][:name]
    #end
    @tenants = renters_a
  end

  def show_tenants
    tenants.each do |tenant|
      if tenant[:gender] == 'm'
        puts "  o".color("#12eff9")
        puts ".-||-.".color("#12eff9")
        puts "  /\\".color("#12eff9")
      else
        puts "  o".color("#ffc0cb")
        puts ".-||-.".color("#ffc0cb")
        puts "  /\\".color("#ffc0cb")
      end
    end
  end

  def is_occupied?
    @tenants.empty?? false : true
  end
end
