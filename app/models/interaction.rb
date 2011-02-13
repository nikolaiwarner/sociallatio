class Interaction < ActiveRecord::Base
  belongs_to :interaction_type
  belongs_to :friend
  belongs_to :user
  
  validates :friend_id, :presence => true
  validates :datetime, :presence => true

  
end
