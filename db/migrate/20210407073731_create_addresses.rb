class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,       null: false 
      t.string :municipality,      null: false  
      t.string :address,           null: false  
      t.string :building_name     
      t.string :phone_number,      null: false    
      t.integer :prefecture_id,    null: false  
      t.integer :order_id,         foreign_key:true, null: false   
      t.timestamps
    end
  end
end

