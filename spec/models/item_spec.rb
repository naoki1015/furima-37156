require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品登録内容に問題ない場合' do
      it 'name,explanation,category_id,status_id,shopping_charge_id,prefecture_id,deadline_id,price,imageがあれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録内容に問題がある場合' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'deadline_idが1では登録できない' do
        @item.deadline_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Deadline can't be blank"
      end
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'shopping_charge_idが1では登録できない' do
        @item.shopping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shopping charge can't be blank"
      end
      it 'status_idが1では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが英字では登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid'
      end
      it 'priceの値が全角数字では登録できない' do
        @item.price = '１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid'
      end
      it 'priceの値が299以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid'
      end
      it 'priceの値が10000000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid'
      end
      it 'ユーザーが紐づいてないと商品は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
