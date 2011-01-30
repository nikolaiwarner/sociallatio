class Interaction < ActiveRecord::Base
  has_one :interaction_type
  belongs_to :friend
end
