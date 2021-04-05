class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :numberday
  
  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    with_options numericality: { other_than: 1 }  do
      validates :category_id 
      validates :condition_id
      validates :charge_id
      validates :prefecture_id
      validates :numberday_id
    end  
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end


  
  
end
