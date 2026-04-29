# POST /api/v1/auth/register
def register
  # Strong Parametersで許可されたパラメータを使ってユーザーを作成
  # create! を使うことで、バリデーションエラー時に例外が発生する（=> 400系レスポンスに繋げやすい）
  user = User.create!(user_params)

  # JWTトークンを生成（payloadにuser_idを含める）
  # encode_token はおそらくJWT.encodeをラップしたメソッド
  token = encode_token({ user_id: user.id })

  # 作成したユーザー情報とトークンを返却
  # パスワードなどの機密情報は含めないように注意
  render json: {
    token: token,
    user: {
      id: user.id,
      email: user.email
    }
  }, status: :created
end

# POST /api/v1/auth/login
def login
  # emailでユーザーを検索（存在しない場合はnil）
  user = User.find_by(email: params[:email])

  # authenticate は has_secure_password によるメソッド
  # パスワードが一致すれば user を返し、不一致なら false
  if user&.authenticate(params[:password])
    # ログイン成功時：JWTトークンを発行
    token = encode_token({ user_id: user.id })

    # トークンとユーザー情報を返却
    render json: {
      token: token,
      user: {
        id: user.id,
        email: user.email
      }
    }, status: :ok
  else
    # 認証失敗時：email or password が不正
    # セキュリティ上、どちらが間違っているかは明示しない
    render json: { error: 'Invalid email or password' }, status: :unauthorized
  end
end