class AddImageColumnToCatsTabl < ActiveRecord::Migration
  def change
    add_column :cats, :img_url, :string
  end
end
