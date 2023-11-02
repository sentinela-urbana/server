# frozen_string_literal: true
class Api::ApplicationController < ActionController::API
  respond_to :json

  before_action :authenticate_user!

  protected

  def authenticate_user!
    @current_user = decode_and_validate_jwt_token
    head :unauthorized unless @current_user
  end

  def decode_and_validate_jwt_token
    token = request.headers['Authorization']&.split(' ')&.last
    user = Warden::JWTAuth::UserDecoder.new.call(token, :user, nil)
    User.find(user.id)
  end
end
