class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :species
      t.integer :health, default: 80
      t.integer :energy, default: 80
      t.integer :trainer_id

      t.timestamps
    end
  end
end
