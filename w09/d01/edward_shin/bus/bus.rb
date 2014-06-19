class Bus

  def initialize
    @capacity = 20
    @passengers = []
    @fare = 2
  end

  def empty?
    @passengers.empty?
  end

  def add(passenger)
    if size < @capacity && passenger.balance >= @fare
      unless contains?(passenger)
        passenger.balance -= @fare
        @passengers.push(passenger)
      end
    end
  end

  def size
    @passengers.length
  end

  def remove(passenger)
    @passengers.delete(passenger)
  end

  def contains?(passenger)
    @passengers.include?(passenger)
  end

  def fare
    @fare
  end

end