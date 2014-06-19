class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :song_id
      t.integer :user_id
      t.integer :price
      t.timestamps
    end
  end
end
