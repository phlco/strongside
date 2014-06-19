class Postcard < Mailitem

  attr_accessor :message

  def initialize(options = {})
    @message = options[:message]
  end


end
