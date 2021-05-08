# DB 設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| password        | string | null: false |
| email           | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

### Association

-has_many :items
-has_many :orders

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| details     | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one    :order

## orders テーブル

| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association

-has_one    :address
-belongs_to :item
-belongs_to :user

## addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| block_number  | string  | null: false |
| building_name | string  | null: false |
| phone_number  | string  | null: false |

### Association

-belongs_to :order