[![Rspec](https://github.com/keychi25/sample-graphql/actions/workflows/rspec.yml/badge.svg)](https://github.com/keychi25/sample-graphql/actions/workflows/rspec.yml)

# sample-graphql

## Usage

1. Docker Desktopを起動し、dockerを起動する

2. Railsで実行するためにパッケージを取得し、Dockerイメージの作成をする
  ```
  $ make setup
  ```

3. データベースの準備（マイグレーション、初期データの投入）を行う
  ```
  $ make rails.command arg="db:migrate"
  $ make rails.command arg="db:seed"
  ```

4.  Railsのアプリケーションを起動する
  ```
  $ make start
  ```

5. 以下のURLにアクセスする

  `https://localhost:8000` 


## Development

1. モデルの作成＆マイグレート

  ```
  $ make rails.command arg="generate model モデル名 name:string"
  $ make rails.command arg="db:migrate"
  ```
2. graphql-rubyが提供している、モデルの型ファイルを自動生成する

  ```
  $ make rails.command arg="generate graphql:object モデル名"
  ```

3. 必要に応じてシードデータを作成して、実行する
  
  ```
  $ make rails.command arg="db:seed"
  ```

4.  クエリを作成する

  ```ruby:/app/graphql/queries/__.rb
  # app/graphql/queries/__.rbを作成して以下のようにする。
  module Queries
    class __ < Queries::BaseQuery

    type [ObjectTypes::モデル名], null: false

      def resolve
        # ここに処理を書く
        ::モデル名.all.order(:id)
      end
    end
  end
  ```

5. クエリのフィールドを追加する

  ```ruby:app/graphql/types/query_type.rb
  module Types
    class QueryType < Types::BaseObject
      # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
      include GraphQL::Types::Relay::HasNodeField
      include GraphQL::Types::Relay::HasNodesField

      # Add root-level fields here.
      # They will be entry points for queries on your schema.

      field :クエリ名, resolver: Queries::__(ここは実際のクラス)
    end
  end
  ```
