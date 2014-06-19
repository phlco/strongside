require_relative 'mail_item'

class Package < Mail_Item
  def initialize
    @content = []
    @broken = false
  end

  def content
    @content
  end

  def is_fragile
    false
  end

  def is_broken
    @broken
  end

  def shake
    @broken = true
  end
end