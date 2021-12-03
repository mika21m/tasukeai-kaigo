# テーブル設計

## users テーブル

| Column                   | Type       | Options                      |
| ------------------------ | ---------- | ---------------------------- |
| name                 | string     | null: false,                 |
| email                    | string     | null: false, unique: true    |
| encrypted_password       | string     | null: false                  |

### Association

- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy

## posts テーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| text                     | text       | null: false                   |
| user                     | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments

## comments テーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| text                     | text       | null: false                   |
| user                     | references | null: false,foreign_key: true |
| post                     | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post