class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  # validates :password, :length => {:minimum => 8 }
  # validates :password, presence: true
  # validates :password_confirmation

  def initialize(options = {})
    @account = []
  end


  def account
    @account
  end

end
