# DB 設計書

## マスタテーブル

---

## back_skills

| カラム名   | 型名     | 説明         | 備考     |
| ---------- | -------- | ------------ | -------- |
| id         | bigint   | ID           | PK       |
| name       | string   | スキル名     | NOT NULL |
| rank       | string   | スキルランク | NOT NULL |
| tag        | string   | タグ         | NOT NULL |
| about      | string   | スキル説明   |          |
| icon       | string   | アイコン画像 | NOT NULL |
| created_at | datetime | 作成日時     | NOT NULL |
| updated_at | datetime | 更新日時     | NOT NULL |

---

## front_skills

| カラム名   | 型名     | 説明         | 備考     |
| ---------- | -------- | ------------ | -------- |
| id         | bigint   | ID           | PK       |
| name       | string   | スキル名     | NOT NULL |
| rank       | string   | スキルランク | NOT NULL |
| tag        | string   | タグ         | NOT NULL |
| about      | string   | スキル説明   |          |
| icon       | string   | アイコン画像 | NOT NULL |
| created_at | datetime | 作成日時     | NOT NULL |
| updated_at | datetime | 更新日時     | NOT NULL |

---

## infra_skills

| カラム名   | 型名     | 説明         | 備考     |
| ---------- | -------- | ------------ | -------- |
| id         | bigint   | ID           | PK       |
| name       | string   | スキル名     | NOT NULL |
| rank       | string   | スキルランク | NOT NULL |
| tag        | string   | タグ         | NOT NULL |
| about      | string   | スキル説明   |          |
| icon       | string   | アイコン画像 | NOT NULL |
| created_at | datetime | 作成日時     | NOT NULL |
| updated_at | datetime | 更新日時     | NOT NULL |

---

## other_skills

| カラム名   | 型名     | 説明         | 備考     |
| ---------- | -------- | ------------ | -------- |
| id         | bigint   | ID           | PK       |
| name       | string   | スキル名     | NOT NULL |
| rank       | string   | スキルランク | NOT NULL |
| tag        | string   | タグ         | NOT NULL |
| about      | string   | スキル説明   |          |
| icon       | string   | アイコン画像 | NOT NULL |
| created_at | datetime | 作成日時     | NOT NULL |
| updated_at | datetime | 更新日時     | NOT NULL |

---

## histories

| カラム名   | 型名     | 説明     | 備考     |
| ---------- | -------- | -------- | -------- |
| id         | bigint   | ID       | PK       |
| title      | string   | タイトル | NOT NULL |
| date       | string   | 日付     | NOT NULL |
| body       | string   | 内容     | NOT NULL |
| created_at | datetime | 作成日時 | NOT NULL |
| updated_at | datetime | 更新日時 | NOT NULL |

---

## jobs

| カラム名   | 型名     | 説明     | 備考     |
| ---------- | -------- | -------- | -------- |
| id         | bigint   | ID       | PK       |
| title      | string   | 職務名   | NOT NULL |
| date       | string   | 日付     | NOT NULL |
| body       | string   | 内容     | NOT NULL |
| created_at | datetime | 作成日時 | NOT NULL |
| updated_at | datetime | 更新日時 | NOT NULL |

---

## licenses

| カラム名   | 型名     | 説明     | 備考     |
| ---------- | -------- | -------- | -------- |
| id         | bigint   | ID       | PK       |
| title      | string   | 資格名   | NOT NULL |
| date       | string   | 取得日   | NOT NULL |
| created_at | datetime | 作成日時 | NOT NULL |
| updated_at | datetime | 更新日時 | NOT NULL |

---

## portfolios

| カラム名        | 型名     | 説明                | 備考     |
| --------------- | -------- | ------------------- | -------- |
| id              | bigint   | ID                  | PK       |
| name            | string   | ポートフォリオ名    | NOT NULL |
| date            | string   | 作成日              | NOT NULL |
| tag             | json     | タグ一覧            | NOT NULL |
| topImg          | string   | トップ画像          | NOT NULL |
| front_url       | string   | フロント URL        |          |
| back_url        | string   | バックエンド URL    |          |
| front_github    | string   | フロント GitHub URL |          |
| back_github     | string   | バック GitHub URL   |          |
| color           | string   | テーマカラー        |          |
| about           | string   | 概要説明            |          |
| aboutImg        | string   | 概要画像            |          |
| function        | string   | 機能説明            |          |
| functionImg     | string   | 機能画像            |          |
| appeal          | string   | アピールポイント    |          |
| appealImg       | string   | アピール画像        |          |
| front_skill     | json     | フロントスキル一覧  |          |
| back_skill      | json     | バックスキル一覧    |          |
| infra_skill     | json     | インフラスキル一覧  |          |
| time            | string   | 制作期間            | NOT NULL |
| prev_title      | string   | 前の記事タイトル    |          |
| prev_article_id | string   | 前の記事 ID         |          |
| next_title      | string   | 次の記事タイトル    |          |
| next_article_id | string   | 次の記事 ID         |          |
| created_at      | datetime | 作成日時            | NOT NULL |
| updated_at      | datetime | 更新日時            | NOT NULL |

---

## posts

| カラム名   | 型名     | 説明     | 備考     |
| ---------- | -------- | -------- | -------- |
| id         | bigint   | ID       | PK       |
| title      | string   | タイトル |          |
| created_at | datetime | 作成日時 | NOT NULL |
| updated_at | datetime | 更新日時 | NOT NULL |

---

## profile

| カラム名 | 型名    | 説明             | 備考 |
| -------- | ------- | ---------------- | ---- |
| id       | integer | ID               | PK   |
| content  | text    | プロフィール内容 |      |
| hobby    | text    | 趣味             |      |
| license  | text    | 資格             |      |

---

## profiles

| カラム名   | 型名     | 説明             | 備考     |
| ---------- | -------- | ---------------- | -------- |
| id         | bigint   | ID               | PK       |
| content    | string   | プロフィール内容 | NOT NULL |
| hobby      | string   | 趣味             | NOT NULL |
| license    | string   | 資格             | NOT NULL |
| created_at | datetime | 作成日時         | NOT NULL |
| updated_at | datetime | 更新日時         | NOT NULL |

---

## users

| カラム名        | 型名     | 説明               | 備考              |
| --------------- | -------- | ------------------ | ----------------- |
| id              | bigint   | ID                 | PK                |
| email           | string   | メールアドレス     | NOT NULL / UNIQUE |
| password_digest | string   | パスワードハッシュ | NOT NULL          |
| created_at      | datetime | 作成日時           | NOT NULL          |
| updated_at      | datetime | 更新日時           | NOT NULL          |
