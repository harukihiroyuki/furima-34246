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

 validates :text, presence: true
 validates :category_id, :item_condition_id, :prefecture_id, :send_day_id, :tax_id, numericality:{other_than:1}
 validates :name, presence: true
 validates :image, presence:true
 validates :price, presence:true
 validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999999 }
end
