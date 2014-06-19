class CreatePocketmonsters < ActiveRecord::Migration
  def change
    create_table :pocketmonsters do |t|
      t.string :name
      t.string :species
      t.integer :health, default: 40
      t.integer :energy, default: 20
      t.integer :owner_id

      t.timestamps
    end
  end
end
