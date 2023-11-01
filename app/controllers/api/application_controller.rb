# frozen_string_literal: true
class Api::ApplicationController < ActionController::Base
  respond_to :json

  before_action :authenticate_user!
  before_action :authorize_user!

  protected

  def authorize_user!
    if current_user.present?
      head :unauthorized
    end
  end
end
