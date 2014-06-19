class Changeanotherthing < ActiveRecord::Migration
  def change
    change_column :machines, :candy_price, :decimal
  end
end
