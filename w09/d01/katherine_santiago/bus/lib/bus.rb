class Bus

  def initialize
    @capacity = 20
    @passengers = []
  end

  def empty?
    @passengers.empty?
  end

  def add(passenger)
    if passenger.balance > fare
      if size < @capacity
        @passengers.push(passenger) unless contains?(passenger)
      end
    end
  end

  def size
    @passengers.length
  end

  def contains?(passenger)
    @passengers.include?(passenger)
  end

  def fare
    2
  end

end