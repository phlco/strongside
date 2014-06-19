class Mailitem

  attr_accessor :ship_to_address, :stamp_value

  def initialize(options = {})
    @ship_to_address = options[:ship_to_address]
    @stamp_value = options[:stamp_value]
  end

end
