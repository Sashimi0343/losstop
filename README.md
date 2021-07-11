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



### ↓------共通で使用するテーブル------↓

## companiesテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| president          | string  | null: false               |
| profile            | text    | null: false               |
| phone              | string  | null: false               |
| prefecture_id      | integer | null: false               |
| city               | string  | null: false               |
| address            | string  | null: false               |
| homepage           | text    |                           |
#### imageはActiveStorageを使用するため未記載

### Association：バザー
- has_many :bazaars
- has_many :order_bazaars
- has_many :review_bazaars
- has_many :contact_bazaars


### Association：逆オークション
- has_many :order_auctions
- has_many :review_auctions
- has_many :contact_auctions




## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| profile            | text   |                           |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association：バザー
- has_many :order_bazaars
- has_many :review_bazaars
- has_many :contact_bazaars


### Association：逆オークション
- has_many :auctions
- has_many :order_auctions
- has_many :contact_auctions



### ↓------バザーでのみ使用するテーブル------↓

## bazaars テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| description         | text       | null: false                    |
| price               | integer    | null: false                    |
| stock               | integer    | null: false                    |
| deadline            | date       | null: false                    |
| category_id         | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| company             | references | null: false, foreign_key: true |
#### imageはActiveStorageを使用するため未記載

### Association
- has_many   :order_bazaars
- has_many   :review-bazaars
- belongs_to :company



## order_bazaars テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| quantity  | integer    |                                |
| bazaar    | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- has_one    :contact_bazaar
- belongs_to :bazaar
- belongs_to :company
- belongs_to :user



## contact_bazaars テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| message       | text       | null: false                    |
| order_bazaar  | references | null: false, foreign_key: true |
| company       | references | foreign_key: true              |
| user          | references | foreign_key: true              |

### Association
- belongs_to :order_bazaar
- belongs_to :company
- belongs_to :user



## review_bazaars テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| comment   | text       | null: false                    |
| bazaar    | references | null: false, foreign_key: true |
| company   | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to :bazaar
- belongs_to :company
- belongs_to :user



### ↓------逆オークションでのみ使用するテーブル------↓


## auctions テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| description         | text       | null: false                    |
| price               | integer    | null: false                    |
| category_id         | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| deadline            | date       | null: false                    |
| user                | references | null: false, foreign_key: true |
#### imageはActiveStorageを使用するため未記載

### Association
- has_many   :order_auctions
- belongs_to :user




## order_auctions テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     |                                |
| description  | text       |                                |
| price        | integer    |                                |
| auction      | references | null: false, foreign_key: true |
| company      | references | null: false, foreign_key: true |
#### imageはActiveStorageを使用するため未記載

### Association
- has_one    :contact_auction
- belongs_to :auction
- belongs_to :company
- belongs_to :user




## contact_auctions テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| message        | text       | null: false                    |
| auction_order  | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |
| company        | references | null: false, foreign_key: true |

### Association
- belongs_to :order_order
- belongs_to :user
- belongs_to :company