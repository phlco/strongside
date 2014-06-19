class CreateAccountsTable < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.decimal :amount
      t.integer :user_id
      t.string  :account_type
      t.timestamps
    end
    add_index :accounts, :user_id

  end

  def self.down
    drop_table :accounts
  end
end
