class User

  def initialize(name)
    @name = name
    @balance = 2
  end

  def name
    @name
  end

  def balance
    @balance
  end

  def work
    @balance += 10
  end



end