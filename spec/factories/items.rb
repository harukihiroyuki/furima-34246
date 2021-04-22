FactoryBot.define do
  factory :item do
    text {Faker::Lorem.sentence}
    name {Faker::Lorem.sentence}
    category_id {3}
    item_condition_id {3}
    tax_id {3}
    prefecture_id {2}
    send_day_id {2}
    price {300}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end 
  end
end
