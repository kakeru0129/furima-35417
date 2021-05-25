require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context '新規投稿できるとき' do
      it 'nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthday、が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが英数混合の6文字以上であれば登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
    end
    context '新規投稿できないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emailが@なしでは登録できない" do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'password:半角英数混合(半角数字のみ)' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'passwordが全角では登録できないこと' do
        @user.password = '１１１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前を入力してください")
      end
      it "first_nameが全角以外では登録できない" do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前全角文字を使用してください")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前を入力してください")
      end
      it "last_nameが全角以外では登録できない" do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前全角文字を使用してください")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カタカナを入力してください")
      end
      it "first_name_kanaがカタカナ以外では登録できない" do
        @user.first_name_kana = '阿あa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カタカナ全角文字を使用してください")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カタカナを入力してください")
      end
      it "last_name_kanaがカタカナ以外では登録できない" do
        @user.last_name_kana = '阿あa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カタカナ全角文字を使用してください")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
