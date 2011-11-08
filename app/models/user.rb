class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :token_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :authentication_token
  
  has_many :friends
  has_many :interactions
  has_many :frequencies
  has_many :interaction_types
  
  ROLES = %w[admin friend banned]
  
  
  before_create :set_default_role
  after_create :setup_default_data
  
  before_save :ensure_authentication_token

  
  def set_default_role
    self.role = "friend"
  end
  
  
  def setup_default_data
    # Interaction Types
    ["Phone Call", "IM/Text", "Email", "Tweet"].each do |type|
      interaction_types.create!(:name => type, :points => 1)
    end
    
    interaction_types.create!(:name => "Meeting", :points => 2)
    interaction_types.create!(:name => "Lunch", :points => 2)
    interaction_types.create!(:name => "Dinner", :points => 3)
    interaction_types.create!(:name => "Hang Out", :points => 5)
    
    # Frequencies
    frequencies.create!(:name => "Daily", :number_of_days => 1)
    frequencies.create!(:name => "Weekly", :number_of_days => 7)
    frequencies.create!(:name => "Every Other Week", :number_of_days => 14)
    frequencies.create!(:name => "Monthly", :number_of_days => 30)
    frequencies.create!(:name => "Every Other Month", :number_of_days => 60)
    frequencies.create!(:name => "Quarterly", :number_of_days => 90)
    frequencies.create!(:name => "Yearly", :number_of_days => 365)  
  end
  
  
#   def to_param
#     username
#   end
  
    
end