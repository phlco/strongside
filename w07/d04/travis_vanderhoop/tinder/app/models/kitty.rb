# == Schema Information
#
# Table name: kitties
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  tagline    :string(255)
#  upvotes    :integer          default(0)
#  downvotes  :integer          default(0)
#  img_url    :string(255)
#  seen?      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Kitty < ActiveRecord::Base
  attr_accessible :name, :tagline, :upvotes, :downvotes, :img_url, :seen
  validates :name, :tagline, :img_url, :presence => true
end
