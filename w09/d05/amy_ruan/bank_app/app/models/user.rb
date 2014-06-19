# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  name            :string(255)
#  balance         :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  attr_accessible :balance, :email, :name, :password, :password_confirmation
  has_many :transactions, :dependent => :destroy
  has_many :accounts
  has_secure_password
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :email, case_insensitive: true
  validates :password, :password_confirmation, :presence => true
  validates :password, length: { minimum: 4 }
  before_save { self.email = email.downcase }


end
