# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Post, Comment]

    can [:update, :destroy], Post, user_id: user.id

    can [:update, :destroy], Comment, user_id: user.id
  end
end
