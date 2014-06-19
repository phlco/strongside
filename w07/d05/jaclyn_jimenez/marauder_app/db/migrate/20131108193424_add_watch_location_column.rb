class AddWatchLocationColumn < ActiveRecord::Migration
  def up
    add_column(:users, :lat, "float")
  end

  def down
  end
end
