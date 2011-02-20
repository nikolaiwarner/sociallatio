class Interaction < ActiveRecord::Base
  belongs_to :interaction_type
  belongs_to :friend
  belongs_to :user
  
  validates :friend_id, :presence => true
  validates :datetime, :presence => true


  after_create :assign_points
  
  
  def assign_points
    friend.score = friend.score + points + interaction_type.points
    friend.save
  end

  
end
