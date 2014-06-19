class AddDefaultValuesToPokemonsTable < ActiveRecord::Migration
  def change
    change_column :pokemons, :health, :integer, default: 80
    change_column :pokemons, :energy, :integer, default: 80
  end
end
