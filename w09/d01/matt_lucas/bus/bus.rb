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
        passenger.balance - fare
        @passengers.push(passenger) unless self.contains?(passenger)
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