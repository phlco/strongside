class Account < ActiveRecord::Base
  attr_accessible :balance, :user_id, :name

  belongs_to :user

  validates :name, :user_id, presence: true

end
