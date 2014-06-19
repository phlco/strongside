class CreateTableAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.float :balance, :default => 0
      t.float :amount
      t.integer :customer_id
      t.timestamps
    end
  end
end
