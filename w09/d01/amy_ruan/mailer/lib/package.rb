require_relative 'mail'

class Package < Mail
  def initialize(options = {})
    @contents = []
    @ship_to_address = options[:ship_to_address]
    @is_fragile = options[:is_fragile]
    @is_broken = false
  end

  def contents
    @contents
  end

  def is_fragile?
    @is_fragile
  end

  def is_broken?
    @is_broken
  end

  def shake
    @is_broken = true if @is_fragile
  end

end