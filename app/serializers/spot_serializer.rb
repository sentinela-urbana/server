# frozen_string_literal: true

class SpotSerializer < ActiveModel::Serializer
  attributes :id

  has_one :address do
    object&.address
  end
end
