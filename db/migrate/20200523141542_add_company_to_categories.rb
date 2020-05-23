class AddCompanyToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :company
  end
end
