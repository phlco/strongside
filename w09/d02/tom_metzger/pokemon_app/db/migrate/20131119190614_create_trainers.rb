class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :email
      t.string :password_digest
      t.string :name

      t.timestamps
    end
  end
end
