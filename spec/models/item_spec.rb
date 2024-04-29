require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) 
  end

  describe '商品のバリデーション' do
    context '異常系' do
      it '商品画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が必須であること' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end

      it '商品の説明が必須であること' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'カテゴリーが空では登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態の情報が必須であること' do
        @item.product_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Product condition can't be blank"
      end

      it '配送料の負担の情報が必須であること' do
        @item.delivery_price_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery price can't be blank"
      end

      it '発送元の地域の情報が必須であること' do
        @item.delivery_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery area can't be blank"
      end

      it '発送までの日数の情報が必須であること' do
        @item.delivery_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date can't be blank"
      end

      it '価格の情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be between ¥300 and ¥9,999,999"
      end

      it '価格は半角数値のみ保存可能であること' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be between ¥300 and ¥9,999,999"
      end
    end
  end
end