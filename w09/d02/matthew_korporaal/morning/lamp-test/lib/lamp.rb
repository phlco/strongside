class Lamp
  attr_accessor :name
  attr_writer :is_on

  def initialize(options = {})
    @name = options[:name]
    @is_on = false
  end

  def is_on?
    @is_on
  end
end
