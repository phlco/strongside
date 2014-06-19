class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :difficulty
      t.integer :calories

      t.timestamps
    end
  end
end
