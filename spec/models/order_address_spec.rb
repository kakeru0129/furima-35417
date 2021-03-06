require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
  describe '購入データ保存' do

    context '購入データが保存される' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '購入データが保存されない' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeが全角では保存できないこと' do
        @order_address.postal_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号をハイフンありで入力してください")
      end
      it 'postal_codeが前3文字以外では保存できないこと' do
        @order_address.postal_code = '12-3456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号をハイフンありで入力してください")
      end
      it 'postal_codeが後4文字以外では保存できないこと' do
        @order_address.postal_code = '123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号をハイフンありで入力してください")
      end
      it 'postal_codeがハイフン無しでは保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号をハイフンありで入力してください")
      end
      it 'area_idが空だと保存できないこと' do
        @order_address.area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'area_idが1だと保存できないこと' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'block_numberが空だと保存できないこと' do
        @order_address.block_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが英数混合だと保存できないこと' do
        @order_address.phone_number = 'abcde123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号をハイフンなしで入力してください")
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号をハイフンなしで入力してください")
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("カード情報を入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
