class User

  def initialize(option = {})
    @name = option[:name]
    @balance = 0
  end

  def name
    @name
  end

  def balance
    @balance
  end

  def balance= input
    @balance = input
  end

  def work
    @balance += 5
  end

end