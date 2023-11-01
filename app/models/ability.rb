# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role.surveillance?
      has_surveillance_access
    elsif user.role.basic?
      has_basic_access
    elsif user.role.admin?
      has_admin_access
    end
  end

  def has_surveillance_access
    can :manage, :all, :namespace => "surveillance"
  end

  def has_basic_access
    # can :manage, :options
  end

  def has_admin_access
    can :manage, :all, :namespace => "admin"
  end
end
