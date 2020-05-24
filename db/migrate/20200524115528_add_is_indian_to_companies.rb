class AddIsIndianToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :is_indian, :boolean, default: false
  end
end
