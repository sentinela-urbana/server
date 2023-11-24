# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role.to_sym
    when :spot
      has_spot_access
    when :surveillance
      has_surveillance_access
    when :basic
      has_basic_access
    when :admin
      has_admin_access
    end
  end

  def has_surveillance_access
    can :manage, :surveillance
  end

  def has_basic_access
    # can :manage, :options
  end

  def has_admin_access
    can :manage, :all, :namespace => "admin"
  end

  def has_spot_access; end
end
