# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  latitude         :string
#  longitude        :string
#  complement       :string
#  postal_code_id   :bigint           not null
#  addressable_type :string           not null
#  addressable_id   :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Address < ApplicationRecord
  belongs_to :postal_code
end
