class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :travel_class
      t.timestamps
    end
  end

  def down
  end
end
