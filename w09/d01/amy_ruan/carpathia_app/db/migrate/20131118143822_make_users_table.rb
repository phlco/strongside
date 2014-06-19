class MakeUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.integer :travel_class
    end
  end
end
