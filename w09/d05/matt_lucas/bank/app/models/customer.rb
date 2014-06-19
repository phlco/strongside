# == Schema Information
#
# Table name: customers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#

class Customer < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  validates :name, :presence => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true
  has_secure_password
  has_many :accounts



end
