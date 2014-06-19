class Bus
  attr_accessor :passengers, :fare, :capacity

  def initialize
    @passengers = []
    @fare = 2
    @capacity = 20
  end

  def empty?
    @passengers.size == 0
  end

  def add(passenger)
    if (size < @capacity && passenger.balance >= @fare)
      @passengers.push(passenger) unless self.contains?(passenger)
    end
  end

  def size
    @passengers.size
  end

  def contains?(passenger)
    @passengers.include?(passenger)
  end


end


# p = ["Mick", "Quin"]
