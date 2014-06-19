class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :balance
      t.text :transaction_list

      t.timestamps
    end
  end
end
