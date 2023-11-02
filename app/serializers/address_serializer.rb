# frozen_string_literal: true

class AddressSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :complement, :created_at, :updated_at

  has_one :postal_code do
    object.postal_code.code
  end
end
