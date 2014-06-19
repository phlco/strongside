class ChangeTypeColumn < ActiveRecord::Migration
  def up
    remove_column :transactions, :type
    add_column :transactions, :trans_type, :string
  end

  def down
  end
end
