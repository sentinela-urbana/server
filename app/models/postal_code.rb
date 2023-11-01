# == Schema Information
#
# Table name: postal_codes
#
#  id             :bigint           not null, primary key
#  postal_code    :string
#  neighbourhood  :string
#  city           :string
#  region_code_id :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class PostalCode < ApplicationRecord

end
