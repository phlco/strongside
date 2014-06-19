class Bus

  def initialize
    @passengers = []
    @capacity = 20
  end

  def empty?
    @passengers.empty?
  end

  def add(passenger)
    if size < @capacity && passenger.balance >= fare
      @passengers.push(passenger) unless contains? passenger
    end
  end

  def size
    @passengers.count
  end

  def contains?(passenger)
    @passengers.include? passenger
  end

  def fare
    @fare = 2
  end
end
