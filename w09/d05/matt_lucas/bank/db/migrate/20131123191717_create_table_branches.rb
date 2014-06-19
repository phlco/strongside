class CreateTableBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :location
      t.timestamps
    end
  end
end