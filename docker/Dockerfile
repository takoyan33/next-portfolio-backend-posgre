# ベースイメージとして Ruby 3.2.6 を使用
FROM ruby:3.2.6

# タイムゾーンを日本時間に設定
ENV TZ=Asia/Tokyo

# RubyGems のバージョン指定（後で gem system update に使用）
ARG RUBYGEMS_VERSION=3.3.20

# PostgreSQL クライアントをインストール（Rails から DB に接続するため）
RUN apt update -qq && apt install -y postgresql-client

# Rails アプリケーション用の作業ディレクトリを作成
RUN mkdir /myapp
WORKDIR /myapp

# Gemfile と Gemfile.lock を先にコピーして、bundle install のキャッシュを有効活用
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# RubyGems を指定バージョンに更新し、依存関係をインストール
RUN gem update --system ${RUBYGEMS_VERSION} && \
    bundle install

# アプリケーション全体をコンテナにコピー
COPY . /myapp

# エントリーポイントスクリプトを配置して実行権限を付与
COPY docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# コンテナ起動時に実行されるエントリーポイントを指定
ENTRYPOINT ["entrypoint.sh"]

# Rails のデフォルトポート（3000番）を開放
EXPOSE 3000

# コンテナ起動時に実行されるデフォルトコマンド
CMD ["rails", "server", "-b", "0.0.0.0"]