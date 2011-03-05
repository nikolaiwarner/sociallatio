class Frequency < ActiveRecord::Base
  belongs_to :user
  has_many :friends
  
  validates :name, :presence => true, :uniqueness => {:scope => :user_id}
  validates :number_of_days, :presence => true, :numericality => true
  
  def to_param
    name
  end

end
