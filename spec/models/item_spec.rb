require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品を出品できる場合' do
      it '全ての情報があれば出品できる' do
        expect(@item).to be_valid
      end
      it '出品できる' do
      end
      
    end
    context '商品を出品できない場合' do
      it 'iamgeが空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"

      end     
      it 'explanationが空だと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'conditionが未選択だと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'chargeが未選択だと出品できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge can't be blank"
      end
      it 'prefectureが未選択だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'numberdayが未選択だと出品できない' do
        @item.numberday_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Numberday can't be blank"
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300より小さいと出品できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"

      end
      it 'priceが9999999より大きいと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"

      end
      it 'priceが半角数字でないと出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      
      end
    end
  end
end
