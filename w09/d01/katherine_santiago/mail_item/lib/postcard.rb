
class Postcard < Mailitem

  def initialize(options = {})
    @message = options[:message]
    @ship_to_address = options[:ship_to_address]
  end

  def message
    @message
  end



end