class CreateArticlesTable < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.integer :comment_id
      t.timestamps
    end
  end

  def down
  end
end
