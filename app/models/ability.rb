class Ability
  include CanCan::Ability
  
  def initialize user
    user ||= User.new
    
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      
      if user.role == 'author'
        can :create, Friend
        can [:update, :destroy], Friend do |friend|
          friend.try(:user) == user
        end
      end
    end
  end
end