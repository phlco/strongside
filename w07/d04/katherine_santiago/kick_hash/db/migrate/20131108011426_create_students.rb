class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :img_url
      t.string :github
      t.string :stypi
      t.string :mobile
      t.string :facebook
      t.string :twitter
      t.boolean :venmo
      t.string :dropbox_email
      t.string :linked_in

      t.timestamps
    end
  end

  def down
    drop_table :students do |t|
      t.string :name
      t.string :email
      t.string :img_url
      t.string :github
      t.string :stypi
      t.string :mobile
      t.string :facebook
      t.string :twitter
      t.boolean :venmo
      t.string :dropbox_email
      t.string :linked_in

      t.timestamps
    end
  end
end
