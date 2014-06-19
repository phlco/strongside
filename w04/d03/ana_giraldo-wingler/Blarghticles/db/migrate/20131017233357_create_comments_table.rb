class CreateCommentsTable < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text :body
      t.integer :article_id
      t.timestamps
    end
  end

  def down
  end
end
