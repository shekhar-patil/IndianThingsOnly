class RemoveCompanyFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_reference :categories, :company
  end
end
