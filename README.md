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
| birthday             | integer    | null: false                   |
- has_many :items
-has_many :buys



## itemsテーブル

| Column       | Type       | Options                         |
| ------       | ------     | -----------                     |
| itemsname    | string     | null: false                     |
| category_id  | integer    | null: false                     |
| condition_id | integer    | null: false                     |
| tax_id       | integer    | null: false                     |
| area_id      | integer    | null: false                     |
| day_id       | integer    | null: false                     |
| price        | integer    | null: false                     |
| seller       | integer    | null: false                     |
| users        | references | null: false, foreign_key: true  |
| text         | text       | null: false                     |



- has_many :users
-has_one :adresses


## buysテーブル

| Column     | Type       | Options                           |
| ------     | ------     | -----------                       |
| items      | references | null: false, foreign_key :true    |
| users      | references | null: false, foreign_key :true    |

- has_many :users
-has_one :adresses

## adressesテーブル

| Column           | Type       | Options                         |
| ------           | ------     | -----------                     |
| adresses         | string     | null: false                     |
| buys             | references | null: false, foreign_key: true  |
| items            | references | null: false, foreign_key: tru   |
| users            | references | null: false, foreign_key: true  |
| postcode         | integer    | null: false                     |
| prefecture       | integer    | null: false                     |
| city             | integer    | null: false                     |
| block            | integer    | null: false                     |
| building         | integer    | null: false                     |
| phone_number     | integer    | null: false                     |
| buy_histories    | string     | null: false                     |
- has_one :items
-has_one :buys


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
