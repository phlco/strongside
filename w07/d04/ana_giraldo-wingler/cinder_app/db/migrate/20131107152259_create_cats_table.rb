class CreateCatsTable < ActiveRecord::Migration
  def up
    create_table :cats do |t|
      t.string :name
      t.string :tag_line
      t.string :sex
      t.string :pic_url
      t.integer :rating, :default => 0
      t.timestamps
    end
  end

  def down
  end
end
