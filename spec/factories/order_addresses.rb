FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id {2}
    municipality { '札幌市' }
    address { '1-1' } 
    building_name { 'ハイツ' }
    phone_number { '09011112222' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
