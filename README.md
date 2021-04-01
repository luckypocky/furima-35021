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
| last_name          | string | NOT NULL    |
| first_name         | string | NOT NULL    |
| last_name_kana     | string | NOT NULL    |
| first_name_kana    | string | NOT NULL    |
| birthday           | date   | NOT NULL    |

### Association

- has_many :items
- has_many :user_purchases

## items テーブル

| Column        | Type       | Options          |
| ------------- | ---------- | ---------------- |
| item_name     | string     | NOT NULL         |
| explanation   | text       | NOT NULL         |
| category_id   | integer    | NOT NULL         |
| condition_id  | integer    | NOT NULL         |
| charge_id     | integer    | NOT NULL         |
| prefecture_id | integer    | NOT NULL         |
| number_day_id | integer    | NOT NULL         |
| price         | integer    | NOT NULL         |
| user_id       | integer    | foreign_key:true |
### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column             | Type       | Options         |
| ------------------ | ---------- | --------------- |
| phone_number       | string     | NOT NULL        |
| user_purchase_id   | integer    | foreign_key:true|


### Association

- belongs_to :item
- has_many :user_purchases
- has_one :adress

## user_purchases テーブル

| Column             | Type       | Options         |
| ------------------ | ---------- | --------------- |
| user_id            | integer    | foreign_key:true|
| purchase_id        | integer    | foreign_key:true|



### Association

- belongs_to :user
- belongs_to :purchase

## addresses テーブル

| Column             | Type       | Options         |
| ------------------ | ---------- | --------------- |
| postal_code        | string     | NOT NULL        |
| municipality       | string     | NOT NULL        |
| address            | string     | NOT NULL        |
| building_name      | string     |                 |



### Association

- belongs_to :purchase