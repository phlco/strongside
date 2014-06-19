class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.decimal :balance,   default: 0
      t.string  :name,      default: 'Checking'
      t.integer :user_id

      t.timestamps
    end
  end
end
