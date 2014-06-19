class CreateStudentsTable < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :image_url
      t.string :github
      t.string :facebook
      t.string :twitter

      t.timestamps
    end
  end
end
