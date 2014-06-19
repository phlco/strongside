class Bus
  attr_accessor :passengers, :fare

  def initialize
    @passengers = []
    @fare = 2
  end

  def empty?
    @passengers.empty?
  end

  def add(passenger)
    if size < 20 && passenger.balance > 2
      @passengers.push(passenger) unless contains(passenger)
    end
  end

  def size
    @passengers.length
  end

  def contains(passenger)
    @passengers.include?(passenger)
  end

end
