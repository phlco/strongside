class Lamp
  attr_reader :on

  def initialize
    @on = false
  end

  def toggle_power
    if @on
      @on = false
    else
      @on = true
    end
  end

end
