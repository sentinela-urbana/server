# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name

  def full_name
    "#{object.name} #{object.last_name}"
  end
end
