class Bus

  def initialize
    @passengers = []
  end

  def empty?
    @passengers.empty?
  end

  def add(passenger)
    @passengers << passenger if !self.contains?(passenger) && self.size < 20
    # above code was refactored from the code below
    # if !self.contains?(passenger)
    #   @passengers << passenger
    # end
  end

  def size
    @passengers.length
  end

  def contains?(passenger)
    @passengers.include?(passenger)
  end

  def remove
    @passengers.pop
  end



end
