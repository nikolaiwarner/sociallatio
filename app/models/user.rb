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
  
  def set_default_role
    self.role = "friend"
  end
  
  def to_param
    username
  end
  
end