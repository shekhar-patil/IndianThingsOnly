class AddCategoryToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :category, :string
  end
end
