# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    can :read, Tweet

    if user.persisted?
      can :create, Tweet
      can [:update, :destroy], Tweet, user_id: user.id
    else
      cannot :update, Tweet
      cannot :destroy, Tweet
    end
  end
end
