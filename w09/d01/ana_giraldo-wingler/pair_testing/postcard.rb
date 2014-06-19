require_relative 'mail_item'

class PostCard < MailItem
  attr_accessor :message

  def initialize(options = {})
    @message = options[:message]
  end

end