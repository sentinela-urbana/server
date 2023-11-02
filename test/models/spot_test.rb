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
require "test_helper"

class SpotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
