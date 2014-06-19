class Machine < ActiveRecord::Base
  attr_accessible :candy, :candy_price, :location, :money, :owner_id
  belongs_to :owner

  after_initialize :set_defaults

  validates :owner_id, :location, presence: true

  START_CANDY = 0
  MAX_CANDY = 500


  def fill(candy)
    self.candy += candy
  end

  def sell

  end

  def set_defaults
    if self.candy.nil?
      self.candy = Machine::START_CANDY
    end

    if self.candy_price.nil?
      self.candy_price = 0.25
    end

    if self.money.nil?
      self.money = 0
    end

  end


end