class Package < MailItem

  attr_accessor :content, :fragile, :broken

  def initialize(options = {})
    @content = options[:content]
    @fragile = false
    @broken = true
  end

  def is_fragile?
    @fragile
  end

  def shake
    if @fragile
      @broken = true
    end

  end

  def is_broken?
    @broken
  end
end