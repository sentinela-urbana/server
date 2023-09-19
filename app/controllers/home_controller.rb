class HomeController < ApplicationController

  before_action :authenticate_user!
  before_action :load_user

  def index
    redirect_to sign_in_path unless user_signed_in?

    @user = User.find(params[:id])
  end

  def load_user
    current_user
  end
end
