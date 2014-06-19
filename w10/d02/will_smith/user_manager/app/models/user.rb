# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  firstname  :string(255)
#  lastname   :string(255)
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :age
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :age, presence: true
end
