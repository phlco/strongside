class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :messages
      t.string :name

      t.timestamps
    end
  end
end
