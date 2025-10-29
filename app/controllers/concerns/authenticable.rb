module Authenticable
  extend ActiveSupport::Concern

  SECRET_KEY = ENV['JWT_SECRET_KEY'].presence || Rails.application.credentials.jwt_secret_key || 'please_change_me'

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    payload = decode_token(token)
    @current_user = User.find_by(id: payload['user_id']) if payload
    render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
  rescue JWT::DecodeError, ActiveRecord::RecordNotFound
    render json: { error: 'Not Authorized' }, status: :unauthorized
  end

  def current_user
    @current_user
  end

  private

  def encode_token(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def decode_token(token)
    return nil if token.blank?
    decoded = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
    decoded[0]
  end
end
