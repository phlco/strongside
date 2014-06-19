class Cats < ActiveRecord::Migration
  def up
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.integer :score, default: 0
      t.text :tag_line
      t.string :image_url
      t.timestamps
    end
  end

  def down
    drop_table :cats
  end
end
