require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) 
  end

  describe 'ユーザー新規登録' do
    context '正常系' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end
  context '異常系' do
    describe 'ユーザー新規登録' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'kana_last_nameeが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana last name can't be blank"
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first name can't be blank"
      end
      it 'kana_first_nameが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it '重複したメールアドレスは登録できない' do
        another_user = FactoryBot.build(:user, email: @user.email)
        @user.save
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'a' * 5
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あいうえおabc123'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'passwordとpassword_confirmationが一致していなければ登録できない' do
        @user.password_confirmation = 'wrong_password'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it '姓（カナ）にカタカナ以外の文字が含まれていると登録できない' do
        @user.kana_last_name = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Kana last name is invalid'
      end

      it '名（カナ）にカタカナ以外の文字が含まれていると登録できない' do
        @user.kana_first_name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Kana first name is invalid'
      end

      it '生年月日が空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
