# == Schema Information
#
# Table name: cats
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  tag_line   :string(255)
#  sex        :string(255)
#  pic_url    :string(255)
#  rating     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cat < ActiveRecord::Base
  attr_accessible :name, :tag_line, :sex, :pic_url, :rating
end
