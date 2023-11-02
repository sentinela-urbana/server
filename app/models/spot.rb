# == Schema Information
#
# Table name: spots
#
#  id         :bigint           not null, primary key
#  region_id  :bigint           not null
#  address_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Spot < ApplicationRecord
  belongs_to :region
  has_one :address, as: :addressable
  has_one :postal_code, through: :address
end
