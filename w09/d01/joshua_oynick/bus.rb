require_relative 'user'

#first thing we have to write to make it pass is to define the class

class Bus

  def initialize
    @passengers = []
    @capacity = 20
  end

  def empty?
    @passengers.empty?
  end

  def add(passenger)
    if size < @capacity
      if passenger.is_a?(User) && passenger.balance > fare
        @passengers.push(passenger) unless @passengers.include? passenger
      end
    end
  end

  def size
    #just write 2 here at first to make it pass - it expects 2. Then rewrite the test to force me to do more work...
    @passengers.length
  end

  def contains?(passenger)
    @passengers.include? passenger
  end

  def fare
    2
  end

end
