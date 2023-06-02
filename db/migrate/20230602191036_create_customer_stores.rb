class CreateCustomerStores < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_stores do |t|
      t.integer :customer_id
      t.integer :store_id

      t.timestamps
    end
  end
end
