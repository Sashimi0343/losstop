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


## companysテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| president          | string  | null: false               |
| profile            | string  | null: false               |
| phone              | string  | null: false               |
| prefecture_id      | integer | null: false               |
| city               | string  | null: false               |
| address            | string  | null: false               |
| homepage           | string  |                           |

### Association

- has_many :items
- has_many :reviews
- has_many :contact_bazaars



## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :order_bazaars
- has_many :reviews
- has_many :contact_bazaars



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| description         | text       | null: false                    |
| price               | integer    | null: false                    |
| stock               | integer    | null: false                    |
| deadline            | date       | null: false                    |
| category_id         | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| days_to_ship_id     | integer    | null: false                    |
| company             | references | null: false, foreign_key: true |
#### imageはActiveStorageを使用するため未記載

### Association

- has_many   :order_bazaars
- has_many   :reviews
- belongs_to :company



## orders_bazaars テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| quantity  | integer    |                                |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- has_one    :contact_bazaar
- belongs_to :user
- belongs_to :item



## contact_bazaars テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | string     | null: false                    |
| order     | references | null: false, foreign_key: true |
| company   | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :order_bazaar
- belongs_to :company
- belongs_to :user



## reviews テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | string     | null: false                    |
| item      | references | null: false, foreign_key: true |
| company   | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :company
- belongs_to :user