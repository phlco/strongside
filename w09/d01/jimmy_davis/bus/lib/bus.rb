class Bus

  def initialize
    @capacity = 20
    @passengers = []
  end

  def empty?
    @passengers.empty?
  end

  def add(passenger)
    if size < @capacity && passenger.balance >= 2
      @passengers.push(passenger) unless self.contains?(passenger)
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
