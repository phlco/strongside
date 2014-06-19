class UpdateAccountsTable < ActiveRecord::Migration
  def change
    change_column_default :accounts, :balance, 0

  end
end
