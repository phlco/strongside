class Bus
  attr_accessor :passengers
  def initialize
    self.passengers = []
  end

  def empty?
    self.size == 0
  end

  def add passenger
    return if passenger.balance < 5
    return if self.passengers.count >= 20
    self.passengers << passenger unless self.contains?(passenger)
  end

  def size
    self.passengers.count
  end

  def contains? passenger
    self.passengers.include? passenger
  end

  def fare
    2
  end

end
