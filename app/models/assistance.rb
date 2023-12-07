class Assistance < ApplicationRecord
  belongs_to :requested_by, class_name: 'User'
  belongs_to :answered_by, class_name: 'User', optional: true

  validate :unique_assistance_without_answer, on: :create
  validate :answered_by_surveillance, on: :update

  scope :opened, -> { where(answered_at: nil) }

  def unique_assistance_without_answer
    return unless requested_by.assistances.opened.exists?

    errors.add(:user, 'you have already asked for assistance')
  end

  def answered_by_surveillance
    return unless answered_by.surveillance?

    errors.add(:user, 'only surveillance can answer this call')
  end
end
