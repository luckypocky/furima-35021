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

| Column             | Type   | Options     |
| ----------------- -| ------ | ----------- |
| nickname           | string | NOT NULL    |
| email              | string | unique: true|
| encrypted_password | string | NOT NULL    |
| name_kanji         | string | NOT NULL    |
| name_kana          | string | NOT NULL    |
| birthday           | integer| NOT NULL    |

### Association

- has_many :items
- has_many :user_purchases

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| item_name     | string     | NOT NULL    |
| explanation   | integer    | NOT NULL    |
| category      | string     | NOT NULL    |
| condition     | string     | NOT NULL    |
| charge        | string     | NOT NULL    |
| prefecture    | string     | NOT NULL    |
| number_days   | string     | NOT NULL    |
| price         | integer    | NOT NULL    |
### Association

- belongs_to :users
- has_many :items

## purchases テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| expiration_date    | integer    | NOT NULL    |
| security_code      | integer    | NOT NULL    |
| postal_code        | integer    | NOT NULL    |
| municipality       | string     | NOT NULL    |
| address            | string     | NOT NULL    |
| building_name      | string     |             |
| phone_number       | integer    | NOT NULL    |


### Association

- has_many :items
- has_many :user_purchases

## user_purchases テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user_id            | integer    | NOT NULL    |
| purchase_id        | integer    | NOT NULL    |



### Association

- belongs_to :users
- belongs_to :purchases