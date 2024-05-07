FactoryBot.define do
  factory :order_delivery do
    postal_code { '123-4567' }
    delivery_area_id { 2 }
    area { '東京都' }
    house_number { '1-1-1' }
    building_name { '' }
    number { '09012345678' }
    user_id { 1 }
    item_id { 1 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end