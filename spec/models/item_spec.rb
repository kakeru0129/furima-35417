require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '商品出品できるとき' do
      it 'image、title、description、category_id、burden_id、area_id、day_id、priceが存在していれば保存できること' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it 'titleが空では登録できないこと' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("タイトルを入力してください")
      end

      it 'descriptionが空では登録できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'category_idが空では登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it 'category_idが1では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it 'status_idが空では登録できないこと' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end

      it 'status_idが1では登録できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end

      it 'burden_idが空では登録できないこと' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it 'burden_idが1では登録できないこと' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it 'area_idが空では登録できないこと' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it 'area_idが1では登録できないこと' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it 'day_idが空では登録できないこと' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it 'day_idが1では登録できないこと' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end

      it 'priceが半角数字以外では保存できないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end

      it 'priceが半角英数混合では保存できないこと' do
        @item.price = '1a'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end

      it 'priceが半角英字では保存できないこと' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end

      it 'priceが300円以下では保存できないこと' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end

      it 'priceが9999999円を超える場合は保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
