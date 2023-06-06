class AddCoordinatesToRetailers < ActiveRecord::Migration[7.0]
  def change
    add_column :retailers, :coordinate_x, :decimal, precision: 20, scale: 20
    add_column :retailers, :coordinate_y, :decimal, precision: 20, scale: 20
  end
end
