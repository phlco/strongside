class FixUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :name
      t.string :email
      t.float :lat
      t.float :lng
      t.timestamps
    end
  end
end
