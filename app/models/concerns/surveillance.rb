# frozen_string_literal: true

module Surveillance
  extend ActiveSupport::Concern

  included do
    has_many :surveillance_regions
    has_many :monitored_regions, through: :surveillance_regions, source: :region
    has_many :monitored_spots, through: :monitored_regions, source: :spots
  end
end
