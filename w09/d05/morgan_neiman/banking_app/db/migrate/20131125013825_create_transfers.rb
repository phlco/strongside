class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.string :kind
      t.float :amount
      t.integer :account_id

      t.timestamps
    end
  end
end
