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

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | NOT NULL    |
| email      | string | NOT NULL    |
| password   | string | NOT NULL    |
| name_kanji | string | NOT NULL    |
| name_kana  | string | NOT NULL    |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| item_name     | string     | NOT NULL    |
| explanation   | integer    | NOT NULL    |
| price         | integer    | NOT NULL    |
### Association

- belongs_to :users
- has_many :items

## purchases テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| credit_card_number | integer    | NOT NULL    |
| expiration_date    | integer    | NOT NULL    |
| security_code      | integer    | NOT NULL    |
| postal_code        | integer    | NOT NULL    |
| municipality       | string     | NOT NULL    |
| address            | string     | NOT NULL    |
| building_name      | string     |             |
| phone_number       | integer    | NOT NULL    |


### Association

- has_many :items
- belongs_to :users
