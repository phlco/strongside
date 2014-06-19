class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.decimal :money
      t.integer :candy
      t.string :location
      t.integer :owner_id
      t.decimal :price

      t.timestamps
    end
  end
end
