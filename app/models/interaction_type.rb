class InteractionType < ActiveRecord::Base
  belongs_to :interaction
  belongs_to :user
end
