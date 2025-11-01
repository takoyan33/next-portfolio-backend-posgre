module Api
  module V1
    class AuthController < ApplicationController
      include Authenticable

      # POST /api/v1/auth/register
      def register
        user = User.create!(user_params)
        token = encode_token({ user_id: user.id })
        render json: { token: token, user: { id: user.id, email: user.email } }, status: :created
      end

      # POST /api/v1/auth/login
      def login
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          token = encode_token({ user_id: user.id })
          render json: { token: token, user: { id: user.id, email: user.email } }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
