# frozen_string_literal: true

class Api::Surveillance::V1::SpotsController < Api::Surveillance::BaseController
  # GET /api/surveillance/spots
  def index
    spots = current_user.monitored_spots.includes(:address)

    render status: :ok, json: { spots: ActiveModelSerializers::SerializableResource.new(spots).as_json }
  end

  # GET /api/surveillance/spots/{id}
  def show
    spot = Spot.find(params[:id])

    render status: :ok, json: ActiveModelSerializers::SerializableResource.new(spot).as_json
  end
end
