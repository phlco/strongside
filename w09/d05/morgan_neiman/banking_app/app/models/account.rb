class Account < ActiveRecord::Base
  attr_accessible :money, :user_id
  belongs_to :user
  has_many :transfers

  after_create do
    self.money ||= 0
  end

end
