# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |
| katakana           | string | null: false |
| birthday           | string | null: false |

## comments テーブル

| Column      | Type       | Options                             |
| ----------- | ---------- | ----------------------------------- |
| content     | text       | null: false                         |
| items       | references | null: false, foreign_key: true      |
| user        | references | null: false, foreign_key:true       |

## items テーブル

| Column        | Type       | Options                         |
| ------------  | ---------- | ------------------------------  |
| image         | string     | null: false                     |
| product_name  | text       | null: false,                    |
| description   | text       | null: false                     |
| category      | string     | null: false                     |
| delivery_price| string     | null: false                     |
| delivery_area | string     | null: false                     |
| delivery_date | string     | null: false                     |
| price         | string     | null: false                     |
| user          | references | null: false, foreign_key: true  |


##  buyers テーブル

| Column      | Type       | Options                             |
| ----------- | ---------- | ----------------------------------- |
| card        | string     | null: false                         |
| adress      | string     | null: false                         |
| items       | references | null: false, foreign_key: true      |
| user        | references | null: false, foreign_key:true       |