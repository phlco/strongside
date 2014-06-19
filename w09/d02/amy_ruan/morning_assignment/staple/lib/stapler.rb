class Stapler
  attr_accessor :num_staples
  attr_reader :color
  attr_writer :is_working

  def initialize(options)
    @color = options[:color]
    @is_working = options[:is_working]
    @num_staples = options[:num_staples]
  end

  def is_working?
    @is_working = @num_staples > 0? true:false
  end

  def reload
    @num_staples += 10
  end

end