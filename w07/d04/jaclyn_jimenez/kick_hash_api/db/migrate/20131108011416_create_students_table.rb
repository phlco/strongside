class CreateStudentsTable < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string :name
      t.string :img_url
      t.string :email
    end
  end

  def down
  end
end
