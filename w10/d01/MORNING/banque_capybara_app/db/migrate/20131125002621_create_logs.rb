class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.decimal :amount
      t.string :action
      t.string :memo
      t.integer :account_id

      t.timestamps
    end
  end
end
