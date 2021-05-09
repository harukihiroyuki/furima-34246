FactoryBot.define do
 factory :address_buy do
   postcode { '123-4567' }
   prefecture_id {3}
   city {'北海道'}
   block {'1-1'}
   building{'ハイツ'}
   phone_number{'09094539280'}
   token {"tok_abcdefghijk00000000000000000"}
 end
end