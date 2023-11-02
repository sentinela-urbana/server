# app/controllers/users/sessions_controller.rb
class Api::Users::LoginController < ::Api::ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  # POST /api/users/login
  def create
    user = User.find_by(email: login_params[:email])

    if user && user.valid_password?(login_params[:password])
      token = generate_jwt_token(user)
      render json: { token: token }, status: :ok
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def generate_jwt_token(user)
    Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
  end
end
