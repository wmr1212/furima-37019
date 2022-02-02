# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| password              | string | null: false               |
| email                 | string | null: false, unique: true |
| first_name            | string | null: false               |
| family_name           | string | null: false               |
| first_name_kana       | string | null: false               |
| family_name_kana      | string | null: false               |
| birth_date            | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_history

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| explanation     | text       | null: false                    |
| condition       | integer    | null: false                    |
| category        | integer    | null: false                    |
| price           | integer    | null: false                    |
| seller          | references | null: false, foreign_key: true |
| delivery_charge | integer    | null: false                    |
| shipping_area   | integer    | null: false                    |
| trading_status  | integer    | null: false                    |

### Association

- belongs_to :users
- has_many :purchase_history

## purchase_history テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| buyer  | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_address テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_code     | integer | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  |             |
| phone_number  | integer | null: false |

### Association

- belongs_to :purchase_history