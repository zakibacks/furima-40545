require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @order_delivery = FactoryBot.build(:order_delivery)
  end

  describe '配送先の住所情報のバリデーション' do
    context '正常系' do
      it '全ての必須項目が正しく入力されている場合、保存ができること' do
        expect(@order_delivery).to be_valid
      end

      it "priceとtokenがあれば保存ができること" do
        expect(@order_delivery).to be_valid
      end

      it '建物名が空でも保存ができること' do
        @order_delivery.building_name = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '異常系' do
      it '郵便番号が必須であること' do
        @order_delivery.postal_code = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Postal code can't be blank"
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能であること' do
        @order_delivery.postal_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Postal code is invalid"
      end

      it '都道府県が必須であること' do
        @order_delivery.delivery_area_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Delivery area can't be blank"
      end

      it '市区町村が必須であること' do
        @order_delivery.area = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Area can't be blank"
      end

      it '番地が必須であること' do
        @order_delivery.house_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "House number can't be blank"
      end

      it '電話番号が必須であること' do
        @order_delivery.number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Number can't be blank"
      end

      it '電話番号は、11桁以内の半角数値は保存できないこと' do
        @order_delivery.number = '090-1234-567899'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Number is too long (maximum is 11 characters)"
      end

      it '電話番号は、9桁以下の半角数値は保存できないこと' do
        @order_delivery.number = '123456789' 
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Number is too short (minimum is 10 characters)"
      end

      it '電話番号に数字以外が含まれている場合は保存できないこと' do
        @order_delivery.number = '123-4567-890'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Number is not a number"
      end

      it 'userが必須であること' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが必須であること' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Item can't be blank"
      end

      it "tokenが空では登録できないこと" do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

