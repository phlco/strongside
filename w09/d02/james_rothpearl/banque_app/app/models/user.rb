class User < ActiveRecord::Base

  has_secure_password

  has_many :accounts

  attr_accessible :email, :name, :password, :password_confirmation

  validates :password, :presence => true,
                        :confirmation => true,
                          :length => {:within => 8..16}

  validates :email, presence: true, uniqueness: true,
      format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  validates :name, presence: true, uniqueness: true


end
