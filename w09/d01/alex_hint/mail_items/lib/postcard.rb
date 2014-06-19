class Postcard < MailItem
  attr_accessor :message

  def initialize(options = {})
    @message = options[:message]
  end

end