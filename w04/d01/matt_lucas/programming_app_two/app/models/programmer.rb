class Programmer < ActiveRecord::Base
  attr_accessible :name, :twitter, :img_url, :company_id
  belongs_to :company
end