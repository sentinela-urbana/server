# == Schema Information
#
# Table name: postal_codes
#
#  id            :bigint           not null, primary key
#  code          :string
#  neighbourhood :string
#  city          :string
#  region_id     :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class PostalCode < ApplicationRecord
  belongs_to :region
end
