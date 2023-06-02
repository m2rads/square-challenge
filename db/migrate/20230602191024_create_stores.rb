class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :store_number
      t.integer :retailer_id

      t.timestamps
    end
  end
end
