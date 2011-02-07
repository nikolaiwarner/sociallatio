class Friend < ActiveRecord::Base
  belongs_to :frequency
  belongs_to :user
  has_many :interactions
end
