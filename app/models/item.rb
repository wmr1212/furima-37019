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

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true, numericality: { 
    less_than_or_equal_to: 9999999,
    greater_than_or_equal_to: 300
    },
    format: { with: /\A[0-9]+\z/ }

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :trading_status_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :image, presence: true

end
