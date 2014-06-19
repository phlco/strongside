class Lamp
  attr_accessor :name
  def initialize(options)
    @name = options[:name]
    @is_on = options[:is_on]
  end

  def is_on?
    @is_on
  end

  def is_on= input
    @is_on = input
  end

  def turn_on
    @is_on = true
  end

end