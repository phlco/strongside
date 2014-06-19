class User

  attr_accessor :balance

  def initialize(options = {})
    @name = options[:name]
    @balance = 0
  end

  def name
    @name
  end

  def work
    @balance += 5
  end

end