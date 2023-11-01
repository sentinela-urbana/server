# frozen_string_literal: true
class Api::Surveillance::BaseController < ::Api::ApplicationController
  before_action :authorize_user!

  rescue_from CanCan::AccessDenied do |exception|
    render json: { status: :forbidden, message: exception.message }
  end

  protected

  def authorize_user!
    authorize! :manage, :monitors
  end
end
