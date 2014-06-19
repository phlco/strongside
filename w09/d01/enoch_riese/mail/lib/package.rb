require_relative "mail_item"
class Package < MailItem
  attr_accessor :content, :is_fragile, :is_broken
  def initialize
    @content = []
    @is_fragile = true
    @is_broken = false
  end
  def shake
    @is_broken = true if @is_fragile == true
  end
end
