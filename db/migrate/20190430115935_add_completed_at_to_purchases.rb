class AddCompletedAtToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :completed_at, :datetime
  end
end
