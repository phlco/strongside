class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.decimal :balance, default: 0.0
      t.integer :user_id

      t.timestamps
    end
  end
end
