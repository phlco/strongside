class AlterScoreColumnOnCatsTable < ActiveRecord::Migration
  def up
    change_column :cats, :score, :integer, :default => 0
  end

  def down
    change_column :cats, :score, :integer, :default => nil
  end
end
