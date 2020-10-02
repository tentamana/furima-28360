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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name       | string | null: false |
| category   | string | null: false |
| price      | string | null: false |
| user-name  | string | null: false |

### Association

- belongs_to :users
- belongs_to :shopping

## shopping テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user-id | references | null: false, foreign_key: true |
| items-id | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :address
- belongs_to :users

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| address | string     |                                |

### Association
- belongs_to :shopping