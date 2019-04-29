class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
