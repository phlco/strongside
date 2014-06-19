class Cats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :image_url
      t.string :name
      t.integer :age
      t.string :tagline
      t.integer :score, :default => 0

      t.timestamps
    end
  end
end
