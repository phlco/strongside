class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.float :balance, :default => 0.00
      t.integer :user_id
      t.string :type

      t.timestamps
    end
  end
end
