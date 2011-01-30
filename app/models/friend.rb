class Friend < ActiveRecord::Base
  has_one :frequency
  has_many :interactions
end
