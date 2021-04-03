require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayがあれば登録できる' do
      expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上で半角英数字を共に含んでいれば登録できる' do
      @user.password = '000aaa'
      @user.password_confirmation = '000aaa'
      expect(@user).to be_valid
      end
    
      it 'last_nameとfirst_nameが全角(平仮名、カタカナ、漢字)であれば登録できる' do
      @user.last_name = '山田'
      @user.first_name = '太郎'
      expect(@user).to be_valid
      end
      it 'last_name_kanaとfirst_name_kanaが全角(カタカナ)であれば登録できる' do
      @user.last_name = 'ヤマダ'
      @user.first_name = 'タロウ'
      expect(@user).to be_valid
      end
    end  

    context '新規登録できないとき' do  
      it 'nicknameが空では登録出来ない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録出来ない' do 
      @user.email = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録出来ない' do
      @user.password = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordがが存在してもpassword_confirmationが空では登録出来ない' do
      @user.password_confirmation = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空では登録出来ない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録出来ない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_name_kanaが空では登録出来ない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'first_name_kanaが空では登録出来ない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birthdayが空では登録出来ない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'last_nameが存在しても全角でないと登録出来ない' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it 'first_nameが存在しても全角でないと登録出来ない' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'last_name_kanaが存在しても全角カナでないと登録出来ない' do
      @user.last_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      it 'first_name_kanaが存在しても全角カナでないと登録出来ない' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailは@が含まれないと登録出来ない' do
      @user.email = 'kkkjjj.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
      end  
      it 'passwordが半角数字のみの場合は登録出来ない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end 
      it 'passwordが半角英字のみの場合は登録出来ない' do 
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end 
      it 'passwordが全角の場合は登録出来ない' do 
      @user.password = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end 
      it 'passwordとpassword_confirmationが一致しない場合は登録出来ない' do
      @user.password = '000aaa'
      @user.password = '00aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include  "Password confirmation doesn't match Password"
      end 
      it 'passwordが5文字以下では登録できない' do
      @user.password = '00aaa'
      @user.password_confirmation = '00aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
    end
  
  end  
end
