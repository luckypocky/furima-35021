class CreateOrderaddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :orderaddresses do |t|

      t.timestamps
    end
  end
end
