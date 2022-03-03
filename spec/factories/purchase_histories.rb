FactoryBot.define do
  factory :purchase_history do
    post_code { "123-4567" }
    shipping_area_id { 2 }
    city { "横浜市緑区" }
    house_number { "青山1-1-1" }
    building_name { "柳ビル１０３" }
    phone_number { 19012345678 }
    user_id { 1 }
  end
end
