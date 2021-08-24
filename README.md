# README
[![Image from Gyazo](https://i.gyazo.com/6baed41d75c27efbde7009ef88e111ac.png)](https://gyazo.com/6baed41d75c27efbde7009ef88e111ac)
<br><br>

# アプリケーション名
## LosStop
<br><br>


# 本番環境
http://35.76.23.73/<br>
BASIC認証<br>
ID：admin<br>
Pass：0343<br>
<br>

テスト用アカウント<br>
・販売企業<br>
　Email：company1@test<br>
　Pass：company1<br>
<br>

・一般顧客<br>
　Email：customer1@test<br>
　Pass：customer1<br>
<br><br>

# 概要
食品に特化した、オークション形式の商品販売サイト。<br>
企業・店舗側は食品を出品、または販売提案することが出来る。<br>
一般ユーザーは企業・店舗が出品した食品を購入し、また募集することも出来る。<br><br>
食品を扱う企業や個人店がなんらかの事情により抱えてしまった過剰在庫を販売することを目的とする。<br>
クラウドファンディング等を利用せずとも在庫処理の機会を得られるのが魅力。<br><br><br>


# ターゲット
販売側：食品メーカー・結婚式場・イベント施設運営企業・飲食店など<br>
購入側：一般顧客<br><br><br>

## こういった方々におすすめ
[![Image from Gyazo](https://i.gyazo.com/f39e537006a7af4e2c55cfc721967819.png)](https://gyazo.com/f39e537006a7af4e2c55cfc721967819)
<br><br>


# 開発の経緯-日本の為、ひいては世界の為に。
世界では食品の約1/3が食べられることなく廃棄されていると言う。<br>
また、学生時代からアルバイトを通じて食品の廃棄問題には大変心を痛めていた。<br>
<br>
昨今の日本では従来に加え、コロナウィルスの蔓延により<br>
飲食店の休業やイベントの中止。<br>
はたまた、結婚披露宴の中止などが全国的に起こっている。<br>
<br>
この影響により、多くの食品が廃棄される事になると共に<br>
また、それらを経営する企業・個人店に甚大な被害を及ぼしている。<br>
<br>
一部、クラウドファンディングやSNSを活用し<br>
大量に抱えた在庫の販売先を求める企業も存在するが<br>
難易度と、在庫数が必要なこともあり決して多くはない。<br>
<br>
わたしは、そんな日本や世界の状況を知り<br>
食べられる事なく廃棄されていった食品達の無念<br>
ひいてはそれに関連する経営者達が直面している問題に対して<br>
少しでも助けになることは出来ないか？と考え<br>
このアプリケーションの開発に至った。<br>
<br><br>
"食べ物"　が　"食べ物"として消費されることで
<br>世界の貧困問題は劇的に改善されると、わたしは信じている。
<br><br>


# 使い方<br>

# 企業・一般　共通
まずは会員登録を行う。<br>
[![Image from Gyazo](https://i.gyazo.com/44ea3bdd2a2851b01c27e4287b03a267.gif)](https://gyazo.com/44ea3bdd2a2851b01c27e4287b03a267)
<br><br>

<br><br><br>

## バザー機能
企業は必要事項を記入して出品が出来る。

# 工夫したポイント
特にUIの分かり易さに注力しました。<br>
全国津々浦々の個人店も利用する事を想定しているため<br>
老若男女問わず「見易くて・分かり易いサイト」を目指しました。<br>
<br>
特に食品情報ページの登録・回覧をほぼ同じにすることで<br>
販売者が直感的に入力・出品を出来るよう努めました。<br>
<br><br>


# 開発環境
## バックエンド
Ruby, Ruby on Rails
<br><br>

## フロントエンド
HTML/Sass, JavaScript
<br><br>

## データベース
MySQL, SequelPro
<br><br>

## インフラ
AWS(EC2), Capistrano, Docker(開発環境)
<br><br>

## Webサーバ
nginx
<br><br>

## アプリケーションサーバ
unicorn
<br><br>

## ソース管理
GitHub, GitHubDesktop
<br><br>

## テスト
RSpec
<br><br>

## エディタ
VSCode
<br><br><br><br>


# 今後実装したい機能
・お知らせ機能<br>
　⇨ユーザーの利便性向上のため
<br><br>


# DB設計
### ↓----------共通で使用するテーブル----------↓

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



<br><br>
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


<br><br>
### ↓----------バザーでのみ使用するテーブル----------↓

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


<br><br>
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


<br><br>
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


<br><br>
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


<br><br>
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



<br><br>
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



<br><br>
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