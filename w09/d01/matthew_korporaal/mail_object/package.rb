require_relative 'mail_item'

class Package < MailItem

  attr_accessor :content

  def initialize
    @content = []
    @fragile = false
    @broken = false
  end

  def fragile?
    @fragile
  end

  def broken?
    @broken
  end

  def shake
    @broken = true
  end

end