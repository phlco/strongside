class Owner < ActiveRecord::Base
  attr_accessible :candy, :money
  has_many :machines

  validates :money, presence: :true

  def take_money(my_machine)
    self.money += my_machine.money
    my_machine.money = 0
  end
  def restock(my_machine, amount)
    my_machine.refill(amount)
  end
end
