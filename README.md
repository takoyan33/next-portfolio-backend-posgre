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

### node バージョン

- node v18.18.0
- npm v9.8.1

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
├── api             #APIのデータ
├── app
│   ├── components #コンポーネントの記載
│   ├── api        #APIの取得
│   ├── about      #Aboutページ
│   ├── contact    #お問い合わせページ
│   ├── portfolio  #ポートフォリオページ
│   ├── portfolios #ポートフォリオ個別ページ
│   ├── skills     #スキルページ
├── public          #画像
├── stories         #storybook
├── styles          #cssの設定
├── hooks           #カスタムフック
├── utils           #共通関数
├── types           #型定義
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
