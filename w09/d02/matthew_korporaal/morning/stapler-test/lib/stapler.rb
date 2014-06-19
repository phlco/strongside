class Stapler
  attr_accessor :name, :color, :num_staples

  def initialize(options = {})
    @name = options[:name]
    @color = options[:color]
    @num_staples = options[:num_staples]
  end

  def is_working?
    @num_staples > 0 ? true : false
  end

  def add(num)
    @num_staples = @num_staples + num
  end

  #def staple
  #def reload

end