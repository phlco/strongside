class RenameOwnerId < ActiveRecord::Migration
  def change
    rename_column :pocketmonsters, :owner_id, :trainer_id
  end

  def down
  end
end
