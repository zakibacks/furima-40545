
# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| kana_first_name    | string | null: false |
| kana_last_name     | string | null: false |
| birthday           | date   | null: false |

has_many : items
has_many : buyers

## items テーブル

| Column               | Type       | Options                         |
| ------------         | ---------- | ------------------------------  |
| product_name         | string     | null: false                     |
| description          | text       | null: false                     |
| price                | decimal    | null: false                     |
| category_id          | integer    | null: false                     |
| product_condition_id | integer    | null: false                     |
| delivery_price_id    | integer    | null: false                     |
| delivery_area_id     | integer    | null: false                     |
| delivery_date_id     | integer    | null: false                     |
| user                 | references | null: false, foreign_key: true  |

belong_to : user
has_one : buyer




##  buyers テーブル

| Column      | Type       | Options                             |
| ----------- | ---------- | ----------------------------------- |
| item        | references | null: false, foreign_key: true      |
| user        | references | null: false, foreign_key:true       |

belong_to : user
belong_to : item

has_one : delivery


## deliveries テーブル

| Column           | Type       | Options                             |
| -----------      | ---------- | ----------------------------------- |
| buyer            | references | null: false, foreign_key: true      |
| postal_code      | string     | null: false                         |
| delivery_area_id | integer    | null: false                         |
| area             | string     | null: false                         |
| house_number     | string     | null: false                         |
| building_name    | string     |                                     |
| number           | string     | null: false                         |

belong_to : buyer