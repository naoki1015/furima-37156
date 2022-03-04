# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false,              |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| birthday           | integer| null: false               |

### Association

- has_many :items
- has_many :purchase_record

## items テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| name            | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | text       | null: false                    |
| status          | text       | null: false                    |
| shopping_charge | text       | null: false                    |          
| consignor       | text       | null: false                    |
| deadline        | text       | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_one :purchase_record
- belongs_to :users

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | integer    | null: false                    |
| building      | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record 
  
# purchase_record テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :items