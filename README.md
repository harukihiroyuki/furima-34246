## usersテーブル

| Column     | Type       | Options                       |
| ------     | ------     | -----------                   |
| username   | string     | null: false                   |
| email      | string     | null: false                   |
| password   | string     | null: false                   |
- has_many :items
-has_many :buys



## itemsテーブル

| Column     | Type       | Options                         |
| ------     | ------     | -----------                     |
| itemsname  | string     | null: false                     |
| category   | string     | null: false                     |
| price      | string     | null: false                     |
| seller     | string     | null: false                     |
| users_id   | references | null: false, foreign_key: true  |


- has_many :users
-has_one :adresses


## buysテーブル

| Column     | Type       | Options                           |
| ------     | ------     | -----------                       |
| buyer      | string     | null: false                       |
| items_id   | references | null: false, foreign_key :true    |
| users_id   | references | null: false, foreign_key :true    |

- has_many :users
-has_one :adresses

## adressesテーブル

| Column     | Type       | Options                         |
| ------     | ------     | -----------                     |
| adresses   | string     | null: false                     |
| buys_id    | references | null: false, foreign_key: true  |
| items_id   | references | null: false, foreign_key: tru   |
| users_id   | references | null: false, foreign_key: true  |


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
