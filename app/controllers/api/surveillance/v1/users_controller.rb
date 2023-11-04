# frozen_string_literal: true

class Api::Surveillance::V1::UsersController < Api::Surveillance::BaseController
  # GET /api/surveillance/v1/users/{id}
  def show
    render status: :ok, json: ActiveModelSerializers::SerializableResource.new(current_user).as_json
  end
end
