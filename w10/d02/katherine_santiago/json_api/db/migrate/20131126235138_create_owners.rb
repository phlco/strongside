class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.float :money, default: 1000.00
      t.integer :candy, default: 10000

      t.timestamps
    end
  end


end
