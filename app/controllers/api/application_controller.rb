# frozen_string_literal: true
class Api::ApplicationController < ActionController::API
  respond_to :json

  before_action :authenticate_user!

  protected

  def authenticate_user!
    @current_user = ::Authentication.new(token:).fetch_user
    head :unauthorized unless @current_user
  end

  def token
    request.headers['Authorization']&.split(' ')&.last
  end
end
