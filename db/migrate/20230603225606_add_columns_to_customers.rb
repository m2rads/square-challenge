class AddColumnsToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :email, :string
    add_column :customers, :phone, :string
    add_column :customers, :age, :integer
  end
end
