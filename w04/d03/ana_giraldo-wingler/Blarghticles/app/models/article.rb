class Article < ActiveRecord::Base
  attr_accessible :title, :text, :comment_id
  has_many :comments
end