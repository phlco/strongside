class Account < ActiveRecord::Base
  attr_accessible :balance, :transaction_list
  belongs_to :user
  before_save :create_transaction_list

  validates_presence_of :balance

  def create_transaction_list
    self.transaction_list = ""
  end

  def add_transaction(action)
    self.transaction_list += action + "\n"
  end

end
