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
    if size < @capacity && passenger.balance > fare
      @passengers << passenger.name unless contains?(passenger)
    end
  end

  def size
    @passengers.size
  end

  def remove(place)
    @passengers.delete_at(place)
  end

  def contains?(passenger)
    @passengers.include?(passenger.name)
  end

  def fare
    @fare
  end

end
