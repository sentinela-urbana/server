# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  taxpayer_registry      :string
#  birth_date             :datetime
#  address                :string
#  streetNumber           :string
#  phone                  :string
#  nome                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  role                   :string
#  region_code_id         :bigint
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :jwt_authenticatable,
    jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  has_one :region_code
end
