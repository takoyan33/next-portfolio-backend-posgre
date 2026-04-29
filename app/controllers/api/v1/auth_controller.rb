module Api
  module V1
    class AuthController < ApplicationController
      include Authenticable

      before_action :authenticate_request, only: [:validate]

      # POST /api/v1/auth/register
      def register
        # Strong Parametersで許可されたパラメータを使ってユーザーを作成
        # create! を使うことで、バリデーションエラー時に例外が発生する（=> 400系レスポンスに繋げやすい）
        user = User.create!(user_params)
        render_auth_response(user, :created)
      end

      # POST /api/v1/auth/login
      def login
        # emailでユーザーを検索（存在しない場合はnil）
        user = User.find_by(email: params[:email])

        # authenticate は has_secure_password によるメソッド
        # パスワードが一致すれば user を返し、不一致なら false
        if user&.authenticate(params[:password])
          render_auth_response(user, :ok)
        else
          # 認証失敗時：email or password が不正
          # セキュリティ上、どちらが間違っているかは明示しない
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      # GET /api/v1/auth/validate
      def validate
        render json: {
          message: 'Token is valid',
          user: {
            id: current_user.id,
            email: current_user.email
          }
        }, status: :ok
      end

      private

      def user_params
        params.permit(:email, :password)
      end

      def render_auth_response(user, status)
        # JWTトークンを生成（payloadにuser_idを含める）
        # encode_token は JWT.encode をラップしたメソッド
        token = encode_token({ user_id: user.id })

        # トークンとユーザー情報を返却
        # パスワードなどの機密情報は含めないように注意
        render json: {
          token: token,
          user: {
            id: user.id,
            email: user.email
          }
        }, status: status
      end
    end
  end
end
