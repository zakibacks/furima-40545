
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
has_many : deliveries
has_one : buyers

## items テーブル

| Column        | Type       | Options                         |
| ------------  | ---------- | ------------------------------  |
| product_name  | string     | null: false,                    |
| description   | text       | null: false                     |
| genre         | text       | null: false                     |
| price         | decimal    | null: false                     |
| user          | references | null: false, foreign_key: true  |

belong_to : users
has_one : buyers
has_one : deliveries



##  buyers テーブル

| Column      | Type       | Options                             |
| ----------- | ---------- | ----------------------------------- |
| card        | string     | null: false                         |
| items       | references | null: false, foreign_key: true      |
| user        | references | null: false, foreign_key:true       |

belong_to : users
belong_to : items

## deliveries テーブル

| Column      | Type       | Options                             |
| ----------- | ---------- | ----------------------------------- |
| items       | references | null: false, foreign_key: true      |
| users       | references | null: false, foreign_key: true      |
| adress      | string     | null: false                         |
| number      | string     | null: false                         |

belong_to : users
belong_to : items