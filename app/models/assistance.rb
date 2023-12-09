class Assistance < ApplicationRecord
  belongs_to :requested_by, class_name: 'User'
  belongs_to :answered_by, class_name: 'User', optional: true

  validate :requested_by_user, on: :create
  validate :unique_assistance_without_answer, on: :create

  validate :answered_by_surveillance, on: :update

  scope :opened, -> { where(answered_at: nil) }

  def unique_assistance_without_answer
    return unless requested_by.requested_assistances.opened.exists?

    errors.add(:assistance, 'you have already asked for assistance')
  end

  def answered_by_surveillance
    return if answered_by.surveillance?

    errors.add(:assistance, 'only surveillance can answer this call')
  end

  def requested_by_user
    return if requested_by.user?

    errors.add(:assistance, 'only user can ask assistance')
  end
end
