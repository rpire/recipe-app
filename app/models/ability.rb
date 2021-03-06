# app/models/ability.rb
class Ability
  # Add in CanCan's ability definition DSL
  include CanCan::Ability

  def initialize(user)
    # Handle the case where we don't have a current_user i.e. the user is a guest
    can :read, :all, public: true

    return unless user.present?

    # Define a few sample abilities
    can :create, [Recipe, Food]
    can :destroy, [Recipe, Food], user: user
    can :read, :all, public: false, user: user
  end
end
