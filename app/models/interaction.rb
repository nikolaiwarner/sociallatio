class Interaction < ActiveRecord::Base
  has_one :interaction_type
  belongs_to :friend
  belongs_to :user
end
