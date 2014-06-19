class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.decimal :money, :precision => 8, :scale => 2
      t.integer :candy
      t.boolean :van

      t.timestamps
    end
  end
end
