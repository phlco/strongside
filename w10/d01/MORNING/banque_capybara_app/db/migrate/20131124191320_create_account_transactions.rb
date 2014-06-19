class CreateAccountTransactions < ActiveRecord::Migration
  def change
    create_table :account_transactions do |t|
      t.string :action
      t.decimal :amount
      t.string :memo
      t.string :to_account
      t.integer :account_id

      t.timestamps
    end
  end
end
