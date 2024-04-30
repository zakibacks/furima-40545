FactoryBot.define do
  factory :item do
    product_name { "テスト商品" }
    description { "テスト説明" }
    price { 1000 }
    category { Category.create(name: "メンズ") }
    product_condition { ProductCondition.create(name: "新品未使用") }
    delivery_price { DeliveryPrice.create(name: "送料込み(出品者負担)") }
    delivery_area { DeliveryArea.create(name: "北海道") }
    delivery_date { DeliveryDate.create(name: "1~2日で発送") }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end