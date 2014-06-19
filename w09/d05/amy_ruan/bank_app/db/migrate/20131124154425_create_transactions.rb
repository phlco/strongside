class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :balance
      t.integer :user_id
      t.integer :account_id

      t.timestamps
    end
  end
end
