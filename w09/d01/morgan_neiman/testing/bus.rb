class Bus
  def initialize
    @passengers = []
    @capacity = 20
  end
  def empty?
    @passengers.empty?
  end
  def add(passenger)
    @passengers << passenger unless ( @passengers.include?(passenger) || @passengers.length == @capacity)
  end
  def size
    @passengers.size
  end
  def contains?(passenger)
    @passengers.include?(passenger)
  end
end