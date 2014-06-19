class CreateCatsTable < ActiveRecord::Migration
  def up
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.string :tagline
      t.string :image
      t.integer :score, default: 0
      t.timestamps
    end
  end

  def down
    drop_table :cats
  end
end
