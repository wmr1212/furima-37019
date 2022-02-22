require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context "商品が出品できる場合" do
      it "nameとexplanationとcondition_idとcategory_idとpriceとdelivery_chage_idとshipping_area_idとtrading_status_idとimageがあれば保存できる" do
        expect(@item).to be_valid
      end
    end
    context "商品が出品できない場合" do
      it "nameが空では保存できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "explanationが空では保存されない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "priceが空では保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角数字の場合、保存できない" do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "condition_idが１では保存されない" do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "category_idが１では保存されない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "delivery_charge_idが１では保存されない" do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it "shipping_area_idが１では保存されない" do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "trading_status_idが１では保存されない" do
        @item.trading_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Trading status can't be blank")
      end
      it "imageが空では保存されない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "userが紐付いていないと保存されない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

