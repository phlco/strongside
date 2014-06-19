class AddUserIdToAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :owner_id
    add_column :accounts, :user_id, :integer
  end
end
