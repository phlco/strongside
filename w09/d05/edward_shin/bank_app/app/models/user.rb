# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password        :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true, on: :create, length: { in: 6..16 }

  has_many :accounts, dependent: :destroy

end
