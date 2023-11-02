# == Schema Information
#
# Table name: surveillance_regions
#
#  id             :bigint           not null, primary key
#  region_code_id :bigint           not null
#  user_id        :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class SurveillanceRegion < ApplicationRecord
  belongs_to :region
  belongs_to :user
end
