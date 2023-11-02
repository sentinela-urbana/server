# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  taxpayer_registry      :string           not null
#  email                  :string           not null
#  name                   :string           not null
#  last_name              :string           not null
#  role                   :string           not null
#  address                :string
#  streetNumber           :string
#  phone                  :string
#  birth_date             :datetime
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
