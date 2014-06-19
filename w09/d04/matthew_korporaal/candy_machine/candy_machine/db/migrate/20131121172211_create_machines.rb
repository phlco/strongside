class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.integer :candy
      t.decimal :money
      t.string :location
      t.decimal :price
      t.integer :owner_id

      t.timestamps
    end
  end
end
