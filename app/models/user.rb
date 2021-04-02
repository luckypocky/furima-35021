class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX  
         validates :nickname, presence: true
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :first_name, presence: true,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶ一-]+\z/ }
         validates :first_name_kana, presence: true,  format: { with: /\A[ァ-ヶ一-]+\z/ }
         validates :birthday, presence: true       
end
