class AddUserIdToRetailers < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:retailers, :user_id)
      add_reference :retailers, :user, foreign_key: true
    end
  end
end
