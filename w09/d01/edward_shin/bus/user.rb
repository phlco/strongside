class User

  def initialize (options = {})
    @name = options[:name]
    @balance = 0
  end
  def name
    @name
  end

  def balance
    @balance
  end

  def balance=input
    @balance = input
  end

  def work
    @balance = @balance + 5
  end

end