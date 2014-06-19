class Account < ActiveRecord::Base
  attr_accessible :balance, :name, :user_id
  belongs_to :user

  validates :name, presence: true

    def deposit(amount)
      if self.balance >= 0
        self.balance += amount
      end
    end

    def withdraw(amount)
      if self.balance > amount
        self.balance -= amount
      end
    end


end
