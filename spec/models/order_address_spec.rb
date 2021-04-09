require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(0.5)
  end

  context '内容に問題がない場合' do
    it 'postal_code,prefecture,municipality,address,phone_number,tokenがあれば保存できること' do
    expect(@order_address).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end
      
    

  context '内容に問題がなある場合' do
    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
    end
    it 'prefectureを未選択だと保存できないこと' do
      @order_address.prefecture_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
    end
    it 'prefecture_idが1だと保存できないこと' do
       @order_address.prefecture_id = 1
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include "Prefecture must be other than 1"
    end
    it 'municipalityが空だと保存できないこと' do
      @order_address.municipality = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Municipality can't be blank"
    end
    it 'addressが空だと保存できないこと' do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Address can't be blank"
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
    end
    it 'phone_numberが11桁以内でないと保存できないこと' do
      @order_address.phone_number = '090111112222'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Phone number is invalid"
    end
    it 'phone_numberにハイフンなどが用いられている場合は保存できないこと' do
      @order_address.phone_number = '090-1111-1111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Phone number is invalid"
    end
    it 'tokenが空だと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
    end
    it 'user_idが空だと保存できないこと' do
      @order_address.user_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "User can't be blank"
    end
    it 'item_idが空だと保存できないこと' do
      @order_address.item_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Item can't be blank"
    end
    
    
  end
end


