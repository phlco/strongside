class Machine < ActiveRecord::Base
  belongs_to :owner
  after_initialize :set_defaults

  attr_accessible :location, :owner_id

  #validates :candy, presence: true
  #validates :candy_price, presence: true
  #validates :money, presence: true
  #validates :location, presence: true
  #validates :owner_id, presence: true

  START_CANDY = 1000
  START_CANDY_PRICE = 0.25
  START_MONEY = 5.00
  START_CANDY_MAX = 1000

  def set_defaults
    self.candy ||= START_CANDY
    self.candy_price ||= START_CANDY_PRICE
    self.money ||= START_MONEY
  end

  def sell_candy
    unless self.candy < 1
      self.candy -= 1
    else
      self.money += self.candy_price
      false
    end
  end

  def fill_machine
    space_left = START_CANDY_MAX - self.candy
    self.owner.candy = self.owner.candy - space_left
    self.candy = START_CANDY_MAX
    self.save
  end

  def get_money
    self.owner.money += self.money
    self.money = START_MONEY
    self.save
    self.owner.save
  end

end