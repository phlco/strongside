class User
  attr_reader :name
  attr_reader :balance

  def initialize(name)
     @name = name
     @balance = 0
  end

  def work
    @balance += 5
  end

end
