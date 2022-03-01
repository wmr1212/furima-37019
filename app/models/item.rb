class Item < ApplicationRecord

  belongs_to :user
  #has_one :purchase_history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :trading_status


  with_options presence: true do

    validates :user_id

    validates :name
    validates :explanation
    validates :price, numericality: { 
      only_integer: true,
      less_than_or_equal_to: 9999999,
      greater_than_or_equal_to: 300
      }

    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :trading_status_id, numericality: { other_than: 1 , message: "can't be blank"}

    validates :image
  end

end
