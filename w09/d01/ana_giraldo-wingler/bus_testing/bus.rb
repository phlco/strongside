class Bus

  def initialize
    @passengers = []
    @fare = 2
  end

  def fare
    @fare
  end

  def empty?
    @passengers.empty?
  end

  def add(passenger)
    @passengers.push(passenger) unless contains?(passenger) || size == 20 || passenger.balance < @fare
    if true
      passenger.balance -= @fare
    end
  end

  def size
    @passengers.length
  end

  def contains?(passenger)
    @passengers.include?(passenger)
  end

end