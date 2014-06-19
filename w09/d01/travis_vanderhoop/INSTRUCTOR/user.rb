class User
  def initialize(options = {})
    @name = options[:name]
    @balance = 0
  end

  def name
    @name
  end

  def balance
    @balance
  end

  def work
    @balance += 5
  end

  def ride_the_bus(bus)
    @balance -= bus.fare
  end

end
