class AddColumnsToRetailers < ActiveRecord::Migration[7.0]
  def change
    add_column :retailers, :business_name, :string
    add_column :retailers, :owner, :string
    add_column :retailers, :email, :string
    add_column :retailers, :phone, :string
    add_column :retailers, :image_url, :string
    add_column :retailers, :diameter, :float
    add_column :retailers, :coordinate_x, :float
    add_column :retailers, :coordinate_y, :float
  end
end
