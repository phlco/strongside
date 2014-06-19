class Bus

  def initialize
    @passengers = []
    @fare = 2
  end

  def add(passenger)
    if passenger.class == User && passenger.balance >= @fare
      # take money before you let them on
      passenger.balance -= @fare
      @passengers.push(passenger) unless self.contains?(passenger) || @passengers.length == 20
    end
  end

  def remove(passenger)
    @passengers.delete(passenger)
  end

  def empty?
    if @passengers.length > 0
      false
    else
      true
    end
  end

  def size
    @passengers.length
  end

  def contains?(passenger)
    @passengers.include?(passenger)
  end

  def passengers
    @passengers
  end

  def fare
    @fare
  end


end
