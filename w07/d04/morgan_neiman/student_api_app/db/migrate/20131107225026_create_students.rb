class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :image_url
      t.timestamps
    end
  end

  def down
    drop_table
  end
end
