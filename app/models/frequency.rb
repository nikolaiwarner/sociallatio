class Frequency < ActiveRecord::Base
  belongs_to :user
  has_many :friends
  
  validates :name, :presence => true, :uniqueness => true
  validates :number_of_days, :presence => true, :uniqueness => true, :numericality => true
  
  def to_param
    name
  end

end
