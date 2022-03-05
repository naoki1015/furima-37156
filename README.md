# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false,              |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column             | Type          | Options                        |
| ------------------ | --------------| ------------------------------ |
| name               | string        | null: false                    |
| explanation        | text          | null: false                    |
| category_id        | integer       | null: false                    |
| status_id          | integer       | null: false                    |
| shopping_charge_id | integer       | null: false                    |          
| prefecture_id      | integer       | null: false                    |
| deadline_id        | integer       | null: false                    |
| price              | integer       | null: false                    |
| user               | references    | null: false, foreign_key: true |

### Association

- has_one :purchase_record
- belongs_to :user

## addresses テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| post_code       | string       | null: false                    |
| prefecture_id   | integer      | null: false                    |
| municipality    | string       | null: false                    |
| house_number    | string       | null: false                    |
| building        | string       |                                |
| phone_number    | string       | null: false                    |
| purchase_record | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record 
  
# purchase_records テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :item
- belongs_to :user