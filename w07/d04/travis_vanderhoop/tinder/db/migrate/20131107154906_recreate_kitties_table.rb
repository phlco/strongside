class RecreateKittiesTable < ActiveRecord::Migration
  def change
      create_table  :kitties do |t|
        t.string    :name
        t.string    :tagline
        t.integer   :upvotes, :default => 0
        t.integer   :downvotes, :default => 0
        t.string    :img_url
        t.boolean   :seen, :default => false
        t.timestamps
      end
  end
end
