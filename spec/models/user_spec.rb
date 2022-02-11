require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it "nicknameとemailとfirst_nameとfamily_nameとfirst_name_kanaとfamily_name_kanaとbirth_date,passwordとpassword_confimationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context "新規登録できない場合" do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以内では登録できない" do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "重複したemailがあると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "emailは＠が含まれていなければ登録できない" do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = 'kouki'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は、全角で入力して下さい")
      end
      it "family_nameが空では登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.family_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name は、全角で入力して下さい")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaは全角カタカナでなければ登録できない" do
        @user.first_name_kana = '宏樹'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角カナで入力して下さい")
      end
      it "family_name_kanaは全角カタカナでなければ登録できない" do
        @user.family_name_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana は全角カナで入力して下さい")
      end
      it "birth_dateが空では登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
    end
  end
end
