class CreateMachinesTable < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.integer :candy
      t.float :money
      t.string :location
      t.integer :owner_id
      t.float :candy_price

      t.timestamps
    end
  end
end