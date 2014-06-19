class Machine < ActiveRecord::Base
  belongs_to :owner
  after_initialize :set_defaults

  attr_accessible :location, :owner_id

  START_CANDY = 200
  START_CANDY_PRICE = 0.25
  START_MONEY = 200.00
  START_CANDY_MAX = 1000

  def set_defaults
    self.candy ||= START_CANDY
    self.candy_price ||= START_CANDY_PRICE
    self.money ||= START_MONEY
  end

  def sell_candy
    unless self.candy < 1
      self.candy -= 1
      self.money += self.candy_price
      self.save
    else
      false
    end
  end

  def fill_machine
    space_left = START_CANDY_MAX - self.candy
    self.owner.candy -= space_left
    self.candy = START_CANDY_MAX
  end

  def get_money
    self.owner.money += self.money
    self.money = START_MONEY
    self.save
    self.owner.save
  end

end