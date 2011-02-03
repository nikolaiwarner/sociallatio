class Friend < ActiveRecord::Base
  belongs_to :frequency
  has_many :interactions
end
