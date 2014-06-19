class CreateKickhashes < ActiveRecord::Migration
  def change
    create_table :kickhashes do |t|
      t.string :name
      t.string :img_url
      t.string :email
      t.timestamps
    end
  end
end
