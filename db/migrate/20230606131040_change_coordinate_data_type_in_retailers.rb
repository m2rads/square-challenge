class ChangeCoordinateDataTypeInRetailers < ActiveRecord::Migration[7.0]
  def change
    change_column :retailers, :coordinate_x, :decimal, precision: 18, scale: 15
    change_column :retailers, :coordinate_y, :decimal, precision: 18, scale: 15
  end
end
