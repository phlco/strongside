class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.decimal :balance
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
