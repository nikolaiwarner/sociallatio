class Ability
  include CanCan::Ability
  
  def initialize user
    user ||= User.new
    
    if user.role == 'admin'
      can :manage, :all
    else
      if user.role == 'friend'
        can :create, [Friend, Interaction, InteractionType, Frequency]
        can [:read, :update, :destroy], [Friend, Interaction, InteractionType, Frequency], :user_id => user.id
      end  
    end
  end
end