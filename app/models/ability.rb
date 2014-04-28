class Ability
  include CanCan::Ability

  def initialize(user)

    if user
      can :manage, :all
    else
      can :manage, :page

    end

  end
end
