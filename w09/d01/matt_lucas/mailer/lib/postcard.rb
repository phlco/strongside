require_relative 'mail'

class Postcard < Mail

  def initialize(options = {})
    @message = options[:message]
    @ship_to_address = options[:ship_to_address]
  end

  def message
    @message
  end
end