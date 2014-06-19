class Mailitem

  def initialize(options = {})
    @ship_to_address = options[:ship_to_address]
    @stamp_value = options[:stamp_value]
  end

  def ship_to_address
    @ship_to_address
  end

  def stamp_value
    @stamp_value
  end
end
