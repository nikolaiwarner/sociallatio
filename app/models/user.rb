class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :token_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  has_many :friends
  has_many :interactions
  has_many :frequencies
  has_many :interaction_types
  
  ROLES = %w[admin friend banned]
  
  before_create :set_default_role
  after_create :setup_default_data
  
  def set_default_role
    self.role = "friend"
  end
  
  
  def setup_default_data
    # Interaction Types
    ["Phone Call", "Hang Out", "Breakfast", "Lunch", "Dinner", "IM/Text", "Meeting", "Email", "Tweet"].each do |type|
      InteractionType.create!(:name => type, :user_id => self.id, :points => 1)
    end
    
    # Frequencies
    Frequency.create!(:user_id => self.id, :name => "Daily", :number_of_days => 1)
    Frequency.create!(:user_id => self.id, :name => "Weekly", :number_of_days => 7)
    Frequency.create!(:user_id => self.id, :name => "Monthly", :number_of_days => 30)
    Frequency.create!(:user_id => self.id, :name => "Bi-Monthly", :number_of_days => 60)
    Frequency.create!(:user_id => self.id, :name => "Quarterly", :number_of_days => 90)
    Frequency.create!(:user_id => self.id, :name => "Yearly", :number_of_days => 365)  
  end
  
  
  def to_param
    username
  end
  
end