class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :account_id
      t.string :type
      t.int :from_acct
      t.int :to_acct
      t.decimal :amount

      t.timestamps
    end
  end
end
