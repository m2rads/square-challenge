class AddStoreNumberAndImageUrlToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :store_number, :string
  add_column :customers, :image_url, :string
  end
end
