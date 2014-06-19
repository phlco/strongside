class AddDefaultToAcctBalance < ActiveRecord::Migration
  def change
    remove_column :accounts, :balance
    add_column :accounts, :balance, :integer, default: 0
  end
end
