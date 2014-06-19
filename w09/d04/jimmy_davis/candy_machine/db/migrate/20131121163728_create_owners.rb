class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.decimal :money
      t.integer :candy

      t.timestamps
    end
  end
end
