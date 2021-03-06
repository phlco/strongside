class GymsTableColumnSwitchUp < ActiveRecord::Migration
  def up
    drop_table :gyms
    create_table :gyms do |t|
      t.string :name
      t.string :game_version
      t.timestamps
    end
  end

  def down
    drop_table :gyms
    create_table :gyms do |t|
      t.string :name
      t.string :location
      t.timestamps
    end
  end
end
