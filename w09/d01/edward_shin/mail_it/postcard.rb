require_relative 'mail_item'

class Postcard < Mail_Item
  def initialize(options={})
    @message = options[:message]
  end

  def message
    @message
  end
end