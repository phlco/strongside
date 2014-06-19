class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.boolean :admin
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
