## usersテーブル

| Column               | Type       | Options                       |
| ------               | ------     | -----------                   |
| username             | string     | null: false                   |
| email                | string     | null: false, unique :true     |
| encrypted_password   | string     | null: false                   |
| lastname             | string     | null: false                   |
| firstname            | string     | null: false                   |
| lastname_furigana    | string     | null: false                   |
| firstname_furigana   | string     | null: false                   |
| birthday             | date       | null: false                   |
- has_many :items
- has_many :buys



## itemsテーブル

| Column            | Type       | Options                         |
| ------            | ------     | -----------                     |
| name              | string     | null: false                     |
| category_id       | integer    | null: false                     |
| item_condition_id | integer    | null: false                     |
| tax_id            | integer    | null: false                     |
| prefecture_id     | integer    | null: false                     |
| send_day_id       | integer    | null: false                     |
| price             | integer    | null: false                     |
| user              | references | null: false, foreign_key: true  |
| text              | text       | null: false                     |
- belongs_to :user
- has_one :buy
## buysテーブル

| Column     | Type       | Options                           |
| ------     | ------     | -----------                       |
| item       | references | null: false, foreign_key :true    |
| user       | references | null: false, foreign_key :true    |

- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column           | Type          | Options                          |
| ------           | ------        | -----------                      |
| address          | string        | null: false                      |
| buy              | references    | null: false, foreign_key :true   |
| postcode         | string        | null: false                      |
| prefecture_id    | integer       | null: false                      |
| city             | string        | null: false                      |
| block            | string        | null: false                      | 
| building         | string        |                                  |
| phone_number     | string        | null: false                      |
- belongs_to :buy