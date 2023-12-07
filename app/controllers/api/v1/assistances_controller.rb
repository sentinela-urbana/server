module Api
  module V1
    class AssistancesController < Api::ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
      rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid

      def create
        @assistance = Assistance.create!(requested_by_id: current_user.id)

        render json: { assistance: @assistance }, status: :created
      end

      def show
        @assistance = Assistance.find_by!(requested_by_id: current_user.id)

        render json: { assistance: @assistance }, status: :ok
      end

      def answer
        @assistance = Assistance.find(params[:id])

        @assistance.update!(answered_by: current_user, answered_at: Time.current)

        head :ok
      end

      protected

      def handle_record_invalid(exception)
        render json: { message: exception.message }, status: :unprocessable_entity
      end

      def handle_record_not_found
        render json: { message: 'Resource not found' }, status: :not_found
      end
    end
  end
end
