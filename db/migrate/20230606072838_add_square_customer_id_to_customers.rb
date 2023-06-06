class AddSquareCustomerIdToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :square_customer_id, :string
    add_index :customers, :square_customer_id
  end
end
