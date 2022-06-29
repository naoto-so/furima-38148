# テーブル設計

## usersテーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false, unique constraint |
| encrypted_password | string | null: false                    |
| second_name        | string | null: false                    |
| first_name         | string | null: false                    |
| second_name_kana   | string | null: false                    |
| first_name_kana    | string | null: false                    |
| date_of_birth      | string | null: false                    |

## itemsテーブル

| Column          | Type       | Options                  |
| --------------- | ---------- | ------------------------ |
| image           | text       | null: false              |
| item_name       | string     | null: false              |
| explanation     | text       | null: false              |
| category        | string     | null: false              |
| condition       | string     | null: false              |
| delivery_charge | string     | null: false              |
| send_area       | string     | null: false              |
| send_days       | string     | null: false              |
| price           | integer    | null: false              |
| user_id         | references | null: false, foreign key |

## ordersテーブル

| Column         | Type       | Options                  |
| -------------- | ---------- | ------------------------ |
| post_number    | integer    | null: false              |
| prefecture     | string     | null: false              |
| city           | string     | null: false              |
| address_number | integer    | null: false              |
| building       | integer    |                          |
| tel            | integer    | null: false              |
| user_id        | references | null: false, foreign key |
| item_id        | references | null: false, foreign key |
