class CreateProgrammersTable < ActiveRecord::Migration
  def up
    create_table :programmers do |t|
      t.string :name
      t.string :twitter_username
      t.string :twitter_pic
      t.timestamp
    end
  end

  def down
    drop_table :programmers
  end
end