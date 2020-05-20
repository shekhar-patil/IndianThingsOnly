class AddIsApprovedToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :is_approved, :boolean
  end
end
