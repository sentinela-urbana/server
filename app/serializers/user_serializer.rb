# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :spot_id, :first_name, :last_name, :role

  def spot_id
    object.spot&.id
  end

  def first_name
    object.name
  end

  def last_name
    object.last_name
  end

  def role
    object.role
  end
end
