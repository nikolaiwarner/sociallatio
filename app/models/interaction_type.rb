class InteractionType < ActiveRecord::Base
  belongs_to :interaction
  belongs_to :user
  
  validates :name, :presence => true, :uniqueness => {:scope => :user_id}
  validates :points, :presence => true, :numericality => true

  
end
