FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    explanation {Faker::Lorem.sentence}
    condition_id { 2 }
    category_id { 2 }
    price {Faker::Number.between(from: 300, to: 9999999)}
    delivery_charge_id { 2 }
    shipping_area_id { 2 }
    trading_status_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
