require 'rails_helper'

RSpec.describe PurchaseHistory, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_history = FactoryBot.build(:purchase_history, user_id: user.id, item_id: item.id)
    sleep 1
  end

  describe '商品の購入' do
    context '商品が購入できる場合' do
      it "post_codeとshipping_area_idとcityとhouse_numberとphone_numberとtokenがあれば購入できる" do
        expect(@purchase_history).to be_valid
      end
      it "building_nameが無くても購入できる" do
        @building_name = ''
        expect(@purchase_history).to be_valid
      end
    end
    context "商品が購入できない場合" do
      it "post_codeが空では保存できない" do
        @purchase_history.post_code = ''
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeは3桁ハイフン4桁の半角文字列でなければ保存できない" do
        @purchase_history.post_code = "123456"
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it "shipping_area_idが１では保存されない" do
        @purchase_history.shipping_area_id = '1'
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "cityが空では保存できない" do
        @purchase_history.city = ''
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberは空では保存されない" do
        @purchase_history.house_number = ''
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberは空では保存されない" do
        @purchase_history.phone_number = ''
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberは半角数値でなければ保存されない" do
        @purchase_history.phone_number = 'ああああああ'
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it "phone_numberは11桁以内の半角数値でなければ保存されない" do
        @purchase_history.phone_number = 190123456789
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "phone_numberは10桁以上の半角数値でなければ保存されない" do
        @purchase_history.phone_number = 190123456
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it "tokenが空では保存されない" do
        @purchase_history.token = ""
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空では保存されない" do
        @purchase_history.user_id = ''
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では保存されない" do
        @purchase_history.item_id = ''
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
