class AddUserIdToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :user_id, :integer
  end
end
