class ApplicationController < ActionController::API
  include SecureHeaders

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  private

  def record_not_found(error)
    render json: { status: 404, error: 'Not Found', message: error.message }, status: :not_found
  end

  def record_invalid(error)
    render json: { status: 422, error: 'Unprocessable Entity', message: error.record.errors.full_messages }, status: :unprocessable_entity
  end

  def record_not_unique(error)
    render json: { status: 409, error: 'Conflict', message: error.message }, status: :conflict
  end

  def parameter_missing(error)
    render json: { status: 400, error: 'Bad Request', message: error.message }, status: :bad_request
  end

  before_action :set_secure_headers
end
