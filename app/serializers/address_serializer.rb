# frozen_string_literal: true

class AddressSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :complement, :postal_code, :created_at, :updated_at

  def postal_code
    object.postal_code.code
  end
end
