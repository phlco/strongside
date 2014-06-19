class User
  attr_accessor :name, :balance, :job

  def initialize(name)
    @name = name
    @balance = 0
    @job = "dev"
  end

  def work
    @balance += 5
  end


end
