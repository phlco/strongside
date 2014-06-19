class AddCatsTable < ActiveRecord::Migration
  def up
    create_table :cats do  |t|
      t.string :name
      t.integer :age
      t.string :tagline
      t.string :image
      t.integer :cuteness, default: 0
    end
  end

  def down
  end
end
