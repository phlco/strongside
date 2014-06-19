require 'pry'
class Bus

  def initialize
    @capacity = 20
    @passenger = []
    @fare = 2
  end

  def empty?
    #!@passenger
    @passenger.empty?
  end

  def add(passenger)
    if (!contains?(passenger) && size < @capacity && passenger.balance >= 2)
     @passenger << passenger
    else
      false
    end
  end

  def remove(passenger)
    contains?(passenger) ? @passenger.delete(passenger) : false
  end

  def size
    @passenger.length
  end

  def contains?(passenger)
    binding.pry
    @passenger.include?(passenger) ? true : false
  end

  def fare
    @fare
  end

end