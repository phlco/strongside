# == Schema Information
#
# Table name: programmers
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  twitter_username :string(255)
#  twitter_pic      :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Programmer < ActiveRecord::Base
  attr_accessible :name, :twitter_username, :twitter_pic, :company_id
  belongs_to :company
end
