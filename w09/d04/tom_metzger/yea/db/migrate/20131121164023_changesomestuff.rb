class Changesomestuff < ActiveRecord::Migration
  def change
    change_column :owners, :money, :decimal
    change_column :machines, :money, :decimal
  end
end
