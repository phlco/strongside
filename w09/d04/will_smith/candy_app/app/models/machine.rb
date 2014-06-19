class Machine < ActiveRecord::Base
  attr_accessible :candy, :location, :money, :owner_id, :price

  belongs_to :owner

  after_initialize :set_defaults

  validates :owner_id, presence: true
  validates :location, presence: true


  START_CANDY = 0
  MAX_CANDY = 500

  def sell(candy)
    self.money += candy * 0.25
    if self.candy == 0
      return "Temporarily out of candy!"
    else
      self.candy -= candy
    end
  end

  def set_defaults
    if self.candy.nil?
      self.candy = Machine::START_CANDY
    end

    if self.price.nil?
      self.price = 0.25
    end

    if self.money.nil?
      self.money = 0
    end
  end
end
