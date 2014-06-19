class CreateCatsTable < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.string :tag_line
      t.text :image_url
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
