class AddKeyToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :key, :string
  end
end
