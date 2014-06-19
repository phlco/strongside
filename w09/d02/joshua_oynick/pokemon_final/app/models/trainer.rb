# == Schema Information
#
# Table name: trainers
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  name            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Trainer < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation

  has_many :monsters, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: true
end
