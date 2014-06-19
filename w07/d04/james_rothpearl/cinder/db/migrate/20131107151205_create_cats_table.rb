class CreateCatsTable < ActiveRecord::Migration
  def up
    create_table :cats do |t|
      t.string :name
      t.string :age
      t.string :tag_line
      t.string :img_url
      t.integer :score, :default => 0
      t.timestamps
    end
  end

  def down
  end
end
