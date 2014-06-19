class CreateUsersTable < ActiveRecord::Migration
  def change
      create_table :users do |t|
        t.string    :name
        t.integer   :age
        t.string    :travel_class
        t.timestamps
      end
  end
end
