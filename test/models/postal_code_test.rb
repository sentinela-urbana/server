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
require "test_helper"

class PostalCodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
