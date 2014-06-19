class Account < ActiveRecord::Base
  belongs_to :user

  attr_accessible :balance, :name, :user_id

  validates :name, :presence => true
  validates :balance, :presence => true

  def initialize
    @balance = 0
  end

end
