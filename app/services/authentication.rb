# frozen_string_literal: true

class Authentication
  def initialize(token: nil, user: nil)
    @token = token if token
    @user = user if user
  end

  attr_accessor :token, :user

  def fetch_user
    user = decode_user_from_token

    return unless user.present? && User.exists?(user.id)

    user
  end

  def generate_token
    Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
  end

  private

  def decode_user_from_token
    Warden::JWTAuth::UserDecoder.new.call(token, :user, nil)
  rescue Warden::JWTAuth::Errors::InvalidToken
    nil
  end
end
