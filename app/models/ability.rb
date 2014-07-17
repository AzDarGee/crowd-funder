class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new  #Guestuser (not logged in)

    if user.is? User::CREATOR
        can :manage, Project, user_id: user.id
    elsif user.is? User::BACKER
        can :read, Project
    else
        can :read, :all
    end


  end
end
