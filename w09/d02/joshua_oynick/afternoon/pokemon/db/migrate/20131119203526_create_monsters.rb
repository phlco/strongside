class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :species
      t.integer :health
      t.integer :energy
      t.integer :trainer_id

      t.timestamps
    end
  end
end
