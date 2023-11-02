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
require "test_helper"

class SurveillanceRegionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
