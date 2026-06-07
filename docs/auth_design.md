# 認証設計書

## 概要

本 API では、メールアドレスとパスワードによるユーザー認証を行い、認証成功時に JWT を発行する。クライアントは発行された JWT を `Authorization` ヘッダーに設定し、ログイン状態の確認が必要な API に送信する。

認証方式は Bearer Token 認証とし、トークン形式は JWT を使用する。

## 使用技術

| 項目 | 内容 |
| --- | --- |
| 認証方式 | JWT Bearer 認証 |
| パスワード認証 | `has_secure_password` |
| パスワード保存方式 | `password_digest` にハッシュ化して保存 |
| JWT ライブラリ | `jwt` gem |
| JWT 署名アルゴリズム | `HS256` |
| トークン有効期限 | 発行から 24 時間 |

## 関連ファイル

| ファイル | 役割 |
| --- | --- |
| `app/controllers/api/v1/auth_controller.rb` | ユーザー登録、ログイン、トークン検証 API を提供する |
| `app/controllers/concerns/authenticable.rb` | JWT の発行、復号、認証処理を共通化する |
| `app/models/user.rb` | ユーザー情報とパスワード認証のバリデーションを定義する |
| `config/routes.rb` | 認証 API のルーティングを定義する |
| `swagger.yaml` | 認証 API の OpenAPI 定義を管理する |

## ユーザーモデル

認証対象は `users` テーブルで管理する。

| カラム | 内容 | 制約 |
| --- | --- | --- |
| `id` | ユーザー ID | 主キー |
| `email` | メールアドレス | 必須、一意、メール形式 |
| `password_digest` | ハッシュ化済みパスワード | 必須 |
| `created_at` | 作成日時 | 必須 |
| `updated_at` | 更新日時 | 必須 |

`User` モデルでは `has_secure_password` を利用する。これにより、平文パスワードは保存せず、`password_digest` にハッシュ化された値を保存する。

パスワードは新規作成時、またはパスワード変更時に 6 文字以上である必要がある。

## 認証 API

### ユーザー新規登録

| 項目 | 内容 |
| --- | --- |
| メソッド | `POST` |
| パス | `/api/v1/auth/register` |
| 認証 | 不要 |
| 概要 | メールアドレスとパスワードでユーザーを作成し、JWT を返却する |

リクエスト例:

```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

成功レスポンス例:

```json
{
  "token": "eyJhbGciOiJIUzI1NiJ9.example.jwt",
  "user": {
    "id": 1,
    "email": "user@example.com"
  }
}
```

| ステータス | 内容 |
| --- | --- |
| `201 Created` | ユーザー登録成功 |
| `422 Unprocessable Entity` | バリデーションエラー |

### ログイン

| 項目 | 内容 |
| --- | --- |
| メソッド | `POST` |
| パス | `/api/v1/auth/login` |
| 認証 | 不要 |
| 概要 | メールアドレスとパスワードを検証し、成功時に JWT を返却する |

リクエスト例:

```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

成功レスポンス例:

```json
{
  "token": "eyJhbGciOiJIUzI1NiJ9.example.jwt",
  "user": {
    "id": 1,
    "email": "user@example.com"
  }
}
```

失敗レスポンス例:

```json
{
  "error": "Invalid email or password"
}
```

| ステータス | 内容 |
| --- | --- |
| `200 OK` | ログイン成功 |
| `401 Unauthorized` | メールアドレスまたはパスワードが不正 |

### トークン検証

| 項目 | 内容 |
| --- | --- |
| メソッド | `GET` |
| パス | `/api/v1/auth/validate` |
| 認証 | 必要 |
| 概要 | ログイン中の JWT が有効か確認する |

リクエストヘッダー:

```http
Authorization: Bearer <token>
```

成功レスポンス例:

```json
{
  "message": "Token is valid",
  "user": {
    "id": 1,
    "email": "user@example.com"
  }
}
```

失敗レスポンス例:

```json
{
  "error": "Not Authorized"
}
```

| ステータス | 内容 |
| --- | --- |
| `200 OK` | トークンが有効 |
| `401 Unauthorized` | トークンが未設定、無効、期限切れ、または対象ユーザーが存在しない |

## JWT 設計

### トークン発行

JWT は `Authenticable#encode_token` で発行する。

ペイロードには以下を含める。

| キー | 内容 |
| --- | --- |
| `user_id` | 認証対象ユーザーの ID |
| `exp` | トークン有効期限の UNIX タイムスタンプ |

有効期限はデフォルトで `24.hours.from_now` とする。

### 署名キー

JWT の署名キーは以下の優先順で取得する。

| 優先順位 | 取得元 |
| --- | --- |
| 1 | 環境変数 `JWT_SECRET_KEY` |
| 2 | `Rails.application.credentials.jwt_secret_key` |

署名キーが漏洩すると JWT を偽造できるため、リポジトリには含めず、環境変数または Rails credentials で管理する。

### トークン検証

JWT は `Authenticable#decode_token` で復号する。復号時は `HS256` を指定し、署名と有効期限を検証する。

復号に成功した場合、ペイロードの `user_id` から `User` を検索し、存在するユーザーを `current_user` として扱う。

## 認証処理フロー

### 登録フロー

1. クライアントが `/api/v1/auth/register` に `email` と `password` を送信する。
2. API が `User.create!` でユーザーを作成する。
3. 作成したユーザー ID を含む JWT を発行する。
4. API が JWT とユーザー情報を返却する。

### ログインフロー

1. クライアントが `/api/v1/auth/login` に `email` と `password` を送信する。
2. API が `email` でユーザーを検索する。
3. `has_secure_password` の `authenticate` でパスワードを検証する。
4. 認証成功時、ユーザー ID を含む JWT を発行する。
5. API が JWT とユーザー情報を返却する。
6. 認証失敗時、`401 Unauthorized` を返却する。

### トークン検証フロー

1. クライアントが `/api/v1/auth/validate` に `Authorization: Bearer <token>` を付けてリクエストする。
2. API が `Authorization` ヘッダーからトークン部分を取得する。
3. JWT の署名と有効期限を検証する。
4. ペイロード内の `user_id` からユーザーを検索する。
5. ユーザーが存在する場合、ログイン中ユーザーとしてユーザー情報を返却する。
6. トークンが無効、期限切れ、未設定、またはユーザーが存在しない場合は `401 Unauthorized` を返却する。

## セキュリティ方針

| 項目 | 方針 |
| --- | --- |
| パスワード保存 | 平文保存せず、`password_digest` にハッシュ化して保存する |
| ログイン失敗時のメッセージ | メールアドレスとパスワードのどちらが誤っているかは返さない |
| トークン送信方法 | `Authorization` ヘッダーに `Bearer <token>` 形式で送信する |
| トークン有効期限 | 24 時間で失効させる |
| 署名キー管理 | `JWT_SECRET_KEY` または Rails credentials で管理する |

## 現在の保護対象

現在、`before_action :authenticate_request` が設定されているのは `AuthController#validate` のみである。

そのため、現時点で JWT が必須なのは以下の API のみとなる。

| メソッド | パス | 用途 |
| --- | --- | --- |
| `GET` | `/api/v1/auth/validate` | ログイン中トークンの有効性確認 |

その他の API をログイン必須にする場合は、対象コントローラに `before_action :authenticate_request` を追加する。

## エラー設計

| ケース | ステータス | レスポンス |
| --- | --- | --- |
| ログイン失敗 | `401 Unauthorized` | `{ "error": "Invalid email or password" }` |
| トークン未設定 | `401 Unauthorized` | `{ "error": "Not Authorized" }` |
| トークン不正 | `401 Unauthorized` | `{ "error": "Not Authorized" }` |
| トークン期限切れ | `401 Unauthorized` | `{ "error": "Not Authorized" }` |
| ユーザー登録バリデーションエラー | `422 Unprocessable Entity` | `ApplicationController#record_invalid` の形式に従う |

## OpenAPI 連携

`swagger.yaml` では Bearer 認証を `bearerAuth` として定義する。

```yaml
securitySchemes:
  bearerAuth:
    type: http
    scheme: bearer
    bearerFormat: JWT
```

認証が必要な API には以下を設定する。

```yaml
security:
  - bearerAuth: []
```

現在は `/api/v1/auth/validate` に設定している。

## 今後の検討事項

| 項目 | 内容 |
| --- | --- |
| 保護対象 API の拡張 | 作成・更新系 API を認証必須にするか検討する |
| リフレッシュトークン | 長期ログインが必要な場合に導入を検討する |
| ログアウト | JWT をサーバー側で無効化する場合、ブラックリスト管理などを検討する |
| レスポンス文言 | `Token is valid` などの英語メッセージを日本語に統一するか検討する |
| HTTPS | 本番環境では JWT を含む通信を HTTPS に限定する |
