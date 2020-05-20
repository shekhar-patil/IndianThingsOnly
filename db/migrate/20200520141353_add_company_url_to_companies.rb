class AddCompanyUrlToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :company_url, :string
  end
end
