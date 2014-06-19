class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.float :money
      t.integer :candy

      t.timestamps
    end
  end
end
