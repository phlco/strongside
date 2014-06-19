class User

  def initialize(options = {})
    @name = options[:name]
    if options[:balance].nil?
      @balance = 0
    else
      @balance = options[:balance]
    end
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

end