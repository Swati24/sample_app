class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    can :read, Article
    send(user.try(:role), user) unless user.new_record?
  end

  def reporter(user)
    can :create, Article
    can [:drafts, :update], Article do |article|
      article.try(:user) == user
    end
    can :read, User
  end

  def editor(user)
    can [:drafts, :publish, :update, :create], Article
    can :read, User
  end

  def admin(user)
    can :manage, :all
  end

end