class AddWatchLocationLongColumn < ActiveRecord::Migration
  def up
    add_column(:users, :lng, "float")
  end

  def down
  end
end
