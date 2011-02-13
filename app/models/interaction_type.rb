class InteractionType < ActiveRecord::Base
  belongs_to :interaction
  belongs_to :user
  
  validates :name, :presence => true
  validates :points, :presence => true, :numericality => true

  
end
