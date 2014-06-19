class Package < MailItem

  attr_accessor :is_fragile, :is_broken

  def initialize
    @content = [1,2]
    @is_fragile = false
    @is_broken = false
  end

  def content
    @content
  end

  def shake
    if @is_fragile
      @is_broken = true
    else
      @is_broken = false
    end
  end

  # def is_fragile?
  #   true
  # end

  # def is_broken?
  #   false
  # end

end
