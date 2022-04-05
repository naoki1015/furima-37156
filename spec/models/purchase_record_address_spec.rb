require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_record_address = FactoryBot.build(:purchase_record_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品購入内容に問題ない場合' do
      it 'post_code,prefecture_id,municipality,house_number,phone_number,user_id,item_id,tokenがあれば登録できる' do
        expect(@purchase_record_address).to be_valid
      end
    end
    context '商品購入内容に問題がある場合' do
      it 'user_idがなければ登録できない' do
        @purchase_record_address.user_id = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idがなければ登録できない' do
        @purchase_record_address.item_id = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'post_codeがなければ登録できない' do
        @purchase_record_address.post_code = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Post code can't be blank"
      end
      it 'post_codeは3桁ハイフン4桁のみ登録できる' do
        @purchase_record_address.post_code = '5203221'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include 'Post code is invalid'
      end
      it 'post_codeは半角文字列のみ登録できる' do
        @purchase_record_address.post_code = '５２０-３２２１'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include 'Post code is invalid'
      end
      it 'prefecture_idがなければ登録できない' do
        @purchase_record_address.prefecture_id = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'municipalityがなければ登録できない' do
        @purchase_record_address.municipality = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'house_numberがなければ登録できない' do
        @purchase_record_address.house_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberがなければ登録できない' do
        @purchase_record_address.phone_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは10桁以上11桁以内のハイフンなしでなければ登録できない' do
        @purchase_record_address.phone_number = '090-1111-1111'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは全角数値は登録できない' do
        @purchase_record_address.phone_number = '０９０１１１１１１１１'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'tokenが空では登録できないこと' do
        @purchase_record_address.token = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
