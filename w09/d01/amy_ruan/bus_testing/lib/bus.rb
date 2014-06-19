class Bus

  def initialize
    @passengers = []
    @capacity = 20
    @bus_fare = 2
  end

  def fare
    @bus_fare
  end


  def empty?
    @passenger.nil?
  end

  def add(passenger)
    if size < @capacity && passenger.balance >= @bus_fare
      unless self.contains?(passenger)
        passenger.balance -= @bus_fare
        @passengers << passenger
      end
    end
  end

  def remove(passenger)
    @passengers.delete(passenger)
  end

  def size
    @passengers.length
  end

  def contains?(passenger)
    @passengers.include?(passenger)
  end

end