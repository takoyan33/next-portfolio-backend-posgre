class ApplicationController < ActionController::API
  include SecureHeaders

  before_action :set_secure_headers
end
