module Api
  module V1
    class UsersController < Api::ApplicationController
      def show
        @user = User.find(params[:id])

        render json: ActiveModelSerializers::SerializableResource.new(@user).as_json, status: :ok
      end
    end
  end
end
