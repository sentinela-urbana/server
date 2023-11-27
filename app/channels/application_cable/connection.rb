module ApplicationCable
  class Connection < ActionCable::Connection::Base
    rescue_from UnauthorizedError, with: :handle_unauthorized
    identified_by :current_user

    def connect
      @current_user = find_verified_user
    end

    private

    def find_verified_user
      token = request.params[:token]
      Authentication.new(token:).fetch_user || reject_unauthorized_connection

      # for test purpouses only
      # if request.params[:token] == "surveillance"
      #   User.find_by(role: "surveillance")
      # elsif request.params[:token] == "spot"
      #   User.find(4)
      # elsif request.params[:token] == "spot2"
      #   User.find(5)
      # else
      #   reject_unauthorized_connection
      # end
    end

    def handle_unauthorized; end
  end
end
