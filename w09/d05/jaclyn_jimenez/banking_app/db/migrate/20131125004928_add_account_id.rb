class AddAccountId < ActiveRecord::Migration
  def change
    add_column :users, :account_id, :string;
  end

  def down
  end
end
