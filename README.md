# To You Design Portfolio API

![image](/public/images/portfolio/portfolio_top3.png)

## 目次

- [システムの特徴](#system-feature)
- [使用技術について](#technology-used)
- [ディレクトリ構成](#directory-structure)
- [ブランチについて](#technology-used)

-[URL](https://to-you-design.vercel.app/)

<h2 id="system-feature">システムの特徴</h2>
 これは、自分のポートフォリオサイトです。<br>
 特徴としては、next.jsで作っており、コンポーネント化できるところは、コンポーネント化をしています。<br>
 また、 Tailwind CSS,FontAwesome などを用いてます。

<h2 id="technology-used">使用言語、環境</h2>

### バックエンド

- [ruby](https://www.ruby-lang.org/ja/) 3.2.6
- [rails](https://rubyonrails.org/) 7.0.2

### テスト

- [rspec](https://rspec.info/) 4.1.0

### ホスティング

- [Render](https://render.com/)

<h2 id="technology-used">ディレクトリ構成</h2>

```
.
app/
├── controllers/      # コントローラ（APIエンドポイントの処理）
│   ├── api/          
│   │   ├── v1/      # API用のコントローラ
│   └── application_controller.rb # 全コントローラ共通の処理
├── models/           # モデル（データベースとのやり取り）
├── helpers/          # ビューヘルパー
├── jobs/             # 非同期処理（バックグラウンドジョブ）
├── mailers/          # メール送信処理
channels/            # WebSocket通信
config/
├── routes.rb         # ルーティング設定
├── application.rb    # アプリケーション全体の設定
├── environments/     # 環境ごとの設定（development, test, production）
├── initializers/     # 初期化処理
db/
├── migrate/          # データベースマイグレーションファイル
├── seeds.rb          # 初期データ投入
lib/
├── tasks/            # Rakeタスク
public/               # 静的ファイル（画像、CSS、JavaScriptなど）
test/                 # テスト
vendor/               # 外部ライブラリ
Gemfile               # Gem（ライブラリ）の管理
Rakefile              # Rakeタスク定義
package.json          # npmパッケージ管理
```

<h2 id="technology-used">ブランチについて</h2>

develop ブランチが開発環境で main が本番環境です。

| ブランチ名 | 役割                       | 派生元  | マージ先 |
| ---------- | -------------------------- | ------- | -------- |
| main       | 公開するものを置くブランチ |         |          |
| develop    | 開発中のものを置くブランチ | main    | main     |
| feature-\* | 新機能開発中に使うブランチ | develop | develop  |

# Author

- 作成者 阿部 舜平
- E-mail harrier2070@gmail.com
