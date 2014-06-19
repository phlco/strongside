class User
  attr_accessor :name, :balance

  def initialize(options = {})
    @name = options[:name]
    @balance = 0
  end

  def work
    @balance += 5
  end

end
