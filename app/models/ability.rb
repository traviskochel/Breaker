class Ability
  include CanCan::Ability

  def initialize(user)
    #regardless of signed in or not
    can :manage, :page

    if user
      #signed in

      if user.beta || user.admin
        #beta and admin
        can :manage, :all
      end

    else
      #people not signed in
    end

  end
end
