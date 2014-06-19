class CreateZombies < ActiveRecord::Migration
  def change
    create_table :zombies do |t|
      t.string :name
      t.integer :brains
      t.boolean :hungry
      t.integer :weapon

      t.timestamps
    end
  end
end
