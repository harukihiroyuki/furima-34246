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

| Column       | Type       | Options                         |
| ------       | ------     | -----------                     |
| name         | string     | null: false                     |
| category_id  | integer    | null: false                     |
| condition_id | integer    | null: false                     |
| tax_id       | integer    | null: false                     |
| area_id      | integer    | null: false                     |
| day_id       | integer    | null: false                     |
| price        | integer    | null: false                     |
| user         | references | null: false, foreign_key: true  |
| text         | text       | null: false                     |
- belongs_to :user
- has_one :adress
## buysテーブル

| Column     | Type       | Options                           |
| ------     | ------     | -----------                       |
| item       | references | null: false, foreign_key :true    |
| user       | references | null: false, foreign_key :true    |

- belongs_to :user
- belongs_to :item
- has_one :adress


## adressesテーブル

| Column           | Type          | Options                         |
| ------           | ------        | -----------                     |
| adress        | string           | null: false                     |
| buy             | references     | null: false, foreign_key :true  |
| postcode         | integer       | null: false                     |
| prefecture       | integer       | null: false                     |
| city             | integer       | null: false                     |
| block            | integer       | null: false                     |
| building         | integer       |                                 |
| phone_number     | string        | null: false                     |
| buy_histories    | references    | null: false, foreign_key  :true |
- belongs_to :buy


# README



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
