class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :score
      t.integer :age
      t.string :tagline

      t.timestamps
    end
  end
end
