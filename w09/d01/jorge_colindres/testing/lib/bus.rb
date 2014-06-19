class Bus
  attr_accessor :fare

  def initialize
    @capacity = 20
    @passengers = []
    @fare = 2
  end

  def empty?
    @passengers.empty?
  end

  def add(passenger)
    if size < @capacity && passenger.balance > @fare
      unless @passengers.include?(passenger)
        passenger.balance -= @fare
        @passengers << passenger
      end
    end
  end

  def remove(passenger)
    @passengers.delete(passenger)
  end

  def size
    @passengers.size
  end

  def contains?(passenger)
    @passengers.include?(passenger)
  end

end
