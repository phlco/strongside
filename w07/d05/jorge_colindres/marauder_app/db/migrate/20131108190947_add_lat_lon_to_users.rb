class AddLatLonToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lat, :decimal
    add_column :users, :lon, :decimal
  end
end
