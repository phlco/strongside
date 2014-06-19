class AddAccountId < ActiveRecord::Migration
  def up
    add_column :transactions, :user_id, :integer
  end

  def down
    drop_column :transactions, :user_id
  end
end
