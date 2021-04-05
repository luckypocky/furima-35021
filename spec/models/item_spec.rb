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
    end
    context '商品を出品できない場合' do
      it '商品が空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'iamgeが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end     
      it 'explanationが空だと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end

      it 'category_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
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
      it 'condition_idが1だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 1"
      end
      it 'chargeが未選択だと出品できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge can't be blank"
      end
      it 'charge_idが1だと出品できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge must be other than 1"
      end  
      it 'prefectureが未選択だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが1だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end  
      it 'numberdayが未選択だと出品できない' do
        @item.numberday_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Numberday can't be blank"
      end
      it 'numberday_idが1だと出品できない' do
        @item.numberday_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Numberday must be other than 1"
      end  
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300より小さいと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"

      end
      it 'priceが9999999より大きいと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"

      end
      it 'priceが全角数字だとと出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが半角英数金剛だと出品できない' do
        @item.price = "2000aa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが半角英語だけでは出品できない' do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      
      
    end
  end
end
