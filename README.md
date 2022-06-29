# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| second_name        | string | null: false               |
| first_name         | string | null: false               |
| second_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| date_of_birth      | date   | null: false               |

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| send_area_id       | integer    | null: false                    |
| send_day_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

## ordersテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |

## addressesテーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| post_number    | integer    | null: false |
| prefecture_id  | integer    | null: false |
| city           | string     | null: false |
| address_number | integer    | null: false |
| building       | integer    |             |
| tel            | integer    | null: false |
