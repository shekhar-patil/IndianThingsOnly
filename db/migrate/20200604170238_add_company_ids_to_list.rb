class AddCompanyIdsToList < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :company_ids, :string, array: true, default: []
  end
end
