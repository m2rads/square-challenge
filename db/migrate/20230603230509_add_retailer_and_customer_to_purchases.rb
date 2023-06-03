class AddRetailerAndCustomerToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchases, :retailer, null: true, foreign_key: true
    add_reference :purchases, :customer, null: true, foreign_key: true
  end
end
