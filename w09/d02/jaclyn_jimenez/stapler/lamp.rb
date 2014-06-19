require 'pry'

class Lamp

  attr_accessor :on
  def initialize
    @on = false
  end

  def switch
    @on = !@on
  end

end
