# == Schema Information
#
# Table name: region_codes
#
#  id          :bigint           not null, primary key
#  region_code :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Region < ApplicationRecord
  has_many :spots
  has_many :users
end
