class PurchaseHistory
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :delivery_charge_id, :post_code, :city, :house_number, :building_name, :phone_number

  with_options presence: true do

    validates :user_id

    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :house_number
    validates :phone_number, presence: true, numericality: { with: /\A\d{10,11}\z/ }
  end

  def save
    order = Oder.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order_id)
  end
  
end
