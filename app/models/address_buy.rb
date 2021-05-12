class AddressBuy
 include ActiveModel::Model
 attr_accessor  :buy_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

 with_options presence: true do
  validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number, format: {with: /\A[-]?[0-9]+(\.[0-9]+)?\z/}
  validates :city
  validates :block
  validates :user_id
  validates :item_id
  validates :token
 end 

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :phone_number, length: { minimum: 10, message: 'is too short' }
  validates :phone_number, length: { maximum: 11, message: 'is too long' }

  def save
   buy = Buy.create(user_id: user_id,item_id: item_id)
   Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, buy_id: buy.id)
  end
end