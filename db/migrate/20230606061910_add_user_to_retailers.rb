class AddUserToRetailers < ActiveRecord::Migration[7.0]
  def change
    add_reference :retailers, :user, foreign_key: true
  end
end
