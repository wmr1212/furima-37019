# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| encrypted_password    | string | null: false               |
| email                 | string | null: false, unique: true |
| first_name            | string | null: false               |
| family_name           | string | null: false               |
| first_name_kana       | string | null: false               |
| family_name_kana      | string | null: false               |
| birth_date            | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_histories

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| condition_id       | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| delivery_charge_id | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| trading_status_id  | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase_history

## purchase_histories テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history