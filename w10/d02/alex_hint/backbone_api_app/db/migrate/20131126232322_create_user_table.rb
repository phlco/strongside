class CreateUserTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string   :firstname
      t.string   :lastname
      t.integer  :age
      t.timestamps
    end
  end

  def down
  end
end
