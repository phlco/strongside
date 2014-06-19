class CreateEntriesTable < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :message
      t.timestamps
    end
  end
end
