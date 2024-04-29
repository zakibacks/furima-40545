require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) 
  end

  describe '商品のバリデーション' do
    context '正常系' do
      it '全ての必須項目が正しく入力されている場合、保存ができること' do
        @item.user = FactoryBot.build(:user)
        @item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
        expect(@item).to be_valid
      end
    end

    context '異常系' do
      it 'userが紐づいていない場合、保存ができないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end

      it 'imageが紐づいていない場合、保存ができないこと' do
        @item.image.purge
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

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

      it 'カテゴリーが未選択の場合、保存ができないこと' do
        @item.category_id = 1 # 未選択のIDを設定
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態が未選択の場合、保存ができないこと' do
        @item.product_condition_id = 1 # 未選択のIDを設定
        @item.valid?
        expect(@item.errors.full_messages).to include "Product condition can't be blank"
      end

      it '配送料の負担が未選択の場合、保存ができないこと' do
        @item.delivery_price_id = 1 # 未選択のIDを設定
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery price can't be blank"
      end

      it '発送元の地域が未選択の場合、保存ができないこと' do
        @item.delivery_area_id = 1 # 未選択のIDを設定
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery area can't be blank"
      end

      it '発送までの日数が未選択の場合、保存ができないこと' do
        @item.delivery_date_id = 1 # 未選択のIDを設定
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date can't be blank"
      end

      it '価格の情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が300円未満の場合、保存ができないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be between ¥300 and ¥9,999,999"
      end

      it '価格が9,999,999円を超える場合、保存ができないこと' do
        @item.price = 10_000_000
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