# frozen_string_literal: true

class Api::Surveillance::SpotsController < Api::Surveillance::BaseController
  # GET /api/surveillance/spots
  def index
    spots = current_user.monitored_spots.includes(:address)
    render status: :ok, json: { spots: ActiveModelSerializers::SerializableResource.new(spots).as_json }
  end
end
