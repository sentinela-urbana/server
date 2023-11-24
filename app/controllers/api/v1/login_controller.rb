# app/controllers/users/sessions_controller.rb
module Api
  module V1
    class LoginController < ::Api::ApplicationController
      skip_before_action :authenticate_user!, only: [:create]

      # POST /api/users/login
      def create
        user = User.find_by(email: login_params[:email])

        if user&.valid_password?(login_params[:password])
          token = ::Authentication.new(user:).generate_token
          render json: { token: }, status: :ok
        else
          render json: { errors: { 'credentials' => ['is invalid'] } }, status: :unprocessable_entity
        end
      end

      private

      def login_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
