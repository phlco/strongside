class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :type
      t.integer :amount
      t.string :memo
      t.integer :account_id
      t.timestamps
    end
  end
end
