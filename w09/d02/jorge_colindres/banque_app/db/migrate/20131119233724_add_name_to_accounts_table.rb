class AddNameToAccountsTable < ActiveRecord::Migration
  def change
    add_column :accounts, :name, :string
  end
end
