class Item < ApplicationRecord

  belongs_to :user
  has_one :purchase_history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :trading_status

  validates :name, :explanation, :price, presence: true

  validates :category_id, :condition_id, :delivery_charge_id, :shipping_area_id, :trading_status_id, numericality: { other_than: 1 , message: "can't be blank"}

end
