class AddIndexToCompany < ActiveRecord::Migration[5.2]
  def change
    add_index :companies, :key
  end
end
