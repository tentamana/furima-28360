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

## users テーブル

| Column       | Type   | Options     |
| _________    | _______ | __________ |
| last_name     | string | null: false |
| name         | string | null: false |
| last_name_kana| string | null: false |
| name_kana    | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| nickname     | string | null: false |
| birthday     | date | null: false |


### Association

- has_many :items
- has_many :shoppings 

## items テーブル

| Column     | Type    | Options     |
| ______     | ________ | ___________ |
| item_name  | string  | null: false |
| item_image | text  | null: false |
| category_id| integer | null: false |
| price      | integer  | null: false |
| user       | references  | null: false, foreign_key: true |
| description| string | null: false |
| status_id  | integer | null: false |
| burden_id  | integer | null: false |
| area_id    | integer | null: false |
| shipment_id| integer | null: false |

### Association

- belongs_to :user
- has_one :shopping

## orders テーブル

| Column  | Type       | Options                        |
| ______  | __________ | ______________________________ |
| user | references | null: false, foreign_key: true |
| item| references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address
- belongs_to :user

## addresses テーブル

| Column      | Type       | Options       |
| ＿＿＿＿＿＿  | ＿＿＿＿＿   |  ＿＿＿＿＿_   |
| postal_code | string     | null: false|
| prefecture  | integer     | null: false |
| municipality| string      | null: false   |
| address     | string      | null: false  |
| building    | string      |  |
| telephone   | string      | null: false |
| shopping    | references   | null: false, foreign_key: true|


### Association
- belongs_to :orders