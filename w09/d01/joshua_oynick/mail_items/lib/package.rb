class Package < Mailitem
  attr_accessor :content, :is_fragile, :is_broken
  def initialize(options = {})
    @content = []
    @is_fragile = options[:is_fragile] || false
    @is_broken = options[:is_broken] || false
  end

  def shake
    if @is_fragile
      @is_broken = true
    end
  end

  def is_broken?
    @is_broken
  end

end
