# frozen_string_literal: true

class Api::Surveillance::SpotsController < ::Api::Surveillance::BaseController
  # GET /api/surveillance/spots
  def index
    render status: :ok, json: { spots: current_user.monitored_spots }
  end
end
