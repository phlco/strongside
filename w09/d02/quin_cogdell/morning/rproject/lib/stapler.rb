class Stapler
  attr_accessor :num_staples

  def initialize(options = {})
    @num_staples = 0
  end

  def staple
    # @num_staples -= 1 unless @num_staples == 0 false
    @num_staples > 0 ? @num_staples -= 1 : false
  end

  def fill(num_staples)
    @num_staples += num_staples
  end

end
