# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

  ### users テーブル
  | Column             | Type   | Options                   |
  | ------------------------------------------------------- |
  | nickname           | string | null: false               |
  | email              | string | null: false, unique: true |
  | encrypted_password | string | null: false               |
  | prefectures_id      | string | null: false               |
  | area_id            | integer | null: false               |
 
  ### Association
  - has_many :posts
  - has_many :comments

  ### posts テーブル
  | Column             | Type            | Option                        |
  | -------------------------------------------------------------------- |
  | title              | string          | null: false                   |
  | explanation        | text            | 
  | genre_id           | integer         | null: false                   |
  | shelf_number_id    | integer         | null: false                   |
  | user               | references      | null: false, foreign_key:true |
  | views              | integer         | null: false                   |

  ### Association
  - belongs_to :user
  - belongs_to :comment
  - has_one :like

  ### comments テーブル
  | Column  | Type         | Options                       |
  | ------------------------------------------------------ |
  | text    | text         | null: false                   |
  | user    | references   | null: false, foreign_key:true |
  | post    | references   | null: false, foreign_key:true |

  ### Association
  - belongs_to :user
  - belongs_to :item

  ### likes テーブル
  | Column  | Type         | Options                       |
  | ---- ------------------------------------------------- |
  | user    | references   | null: false, foreign_key:true |
  | post    | references   | null: false, foreign_key:true |
  ### Association
  - belongs_to :post