class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new
    
    if user.member?(:admin)
      can :manage, :all
    elsif user.member?(:staff)
      can :manage, :all
      cannot :manage, :admin
    else
      can :manage, :home
    end
  end
end
