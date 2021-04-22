class Item < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category
 belongs_to :user
 belongs_to :item_condition
 belongs_to :prefecture
 belongs_to :send_day
 belongs_to :tax
 has_one :buy
 has_one_attached :image

 with_options presence: true do
   validates :text
   validates :name
   validates :image
   validates :price
 end

  validates :category_id, :item_condition_id, :prefecture_id, :send_day_id, :tax_id, numericality:{other_than:1}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999999 }
  validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角で入力してください'} 
 end

