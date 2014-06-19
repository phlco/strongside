class Machine < ActiveRecord::Base
  attr_accessible :candy, :candy_price, :location, :money, :owner_id
  belongs_to :owner
  validates :candy, presence: true
  validates :candy_price, presence: true
  validates :money, presence: true
  validates :location, presence: true
  validates :owner_id, presence: true

  # after_initialize :set_defaults

  # START_MONEY = 0
  # START_CANDY = 1000

  def sell_candy(num, candy_price)
    self.money += (num * candy_price)
    self.candy -= num
  end

  def money
    self.money
  end

  # def set_defaults
  #   if self.candy.nil?
  #     self.candy = Owner::START_CANDY
  #   end
  # end

end
