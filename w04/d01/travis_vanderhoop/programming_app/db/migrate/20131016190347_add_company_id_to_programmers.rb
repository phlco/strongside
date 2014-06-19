class AddCompanyIdToProgrammers < ActiveRecord::Migration
  def change
    add_column :programmers, :company_id, :integer #table_name, new_column_name
  end
end
